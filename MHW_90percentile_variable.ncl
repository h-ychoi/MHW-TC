; ==============================================================
; Calculate the frequency, duration, intensity of MHW
; ==============================================================

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

begin

; ==============================================================

  latS   =  0.
  latN   =  50.
  lonL   =  0.
  lonR   =  360.

  yrStrt = 1982
  yrLast = 2019
  yr = yrLast-yrStrt+1

; ==============================================================
; Open the file: Read only the user specified period
; ==============================================================
 
 dir = "/mnt/c/Users/DL/Dropbox/0.code/NCL/MHW/2.data/OISST/"

;thres
 fthres = addfile(dir+"OISST_MHW_90percentile_thres.1982-2011.nc","r")
 thres = fthres->thres({"20110701":"20110930"},{latS:latN},{lonL:lonR})

;climat
 fclim = addfile(dir+"OISST_MHW_climatology.1982-2011.nc","r")
 climm = fclim->sst(:,{latS:latN},{lonL:lonR})

 climm!0 = "time"
 yyyymmdd2 = yyyymmdd_time(2011,2011,"integer")
 climm&time = yyyymmdd2({20110101:20111231})
 clim = climm({"20110501":"20111031"},:,:)
 
; ==============================================================
; Open the file: Read only the user specified period
; ==============================================================

 do yy = yrStrt, yrLast
  print(yy)
  fpath = systemfunc("ls /mnt/d/OISSTv2/sst.day.mean."+yy+".v2.nc")
  f = addfiles(fpath,"r")
  x = f[:]->sst(:,{latS:latN},{lonL:lonR})

  x!0 = "time"

  yyyymmdd = yyyymmdd_time(yy,yy,"integer")
  x&time = yyyymmdd({yy+"0101":yy+"1231"})
  delete(yyyymmdd)

  ;Summer -> JAS
  xx_summer = x({yy+"0701":yy+"0930"},:,:)
  delete(x)


; ==============================================================
; 5day
; ==============================================================
  mhw_5day_fre = new((/nlat,nlon/),float)
  mhw_5day_dur = new((/nlat,nlon/),float)
  exx = new((/92,nlat,nlon/),float)
  mhw_5day_int = new((/nlat,nlon/),float)
  mhw_5day_clm = new((/nlat,nlon/),float)

  int_temp = xx_summer - clim
  clim_temp = clim*1

  do ii=0,nlon-1
   do jj=0,nlat-1
    temp = int_temp(:,jj,ii)
    if (.not.(ismissing(temp(0)))) then
     xs = dim_pqsort_n(temp,2,0)
     mhw_5day_int(jj,ii) = temp(nmed)
     temp_ind = ind(int_temp(:,jj,ii) .eq. temp(nmed))
     mhw_5day_clm(jj,ii) = clim_temp(temp_ind(0),jj,ii)
     delete(temp_ind)
    end if
   end do
  end do


  hw = 0
  do la = 0,nlat-1
   do lo = 0,nlon-1
    do nd = 0, 91-4

     if (nd.eq.0) then

      if(.not.(ismissing(xx_summer(nd,la,lo))) .and. .not.(ismissing(xx_summer(nd+1,la,lo))) .and. .not.(ismissing(xx_summer(nd+2,la,lo))) .and. .not.(ismissing(xx_summer(nd+3,la,lo))) .and. .not.(ismissing(xx_summer(nd+4,la,lo))) .and.\
        xx_summer(nd,la,lo).ge.thres(nd,la,lo) .and. xx_summer(nd+1,la,lo).ge.thres(nd+1,la,lo) .and. xx_summer(nd+2,la,lo).ge.thres(nd+2,la,lo) .and. xx_summer(nd+3,la,lo).ge.thres(nd+3,la,lo) .and. xx_summer(nd+4,la,lo).ge.thres(nd+4,la,lo)) then
        hw = hw+1
        exx(nd,la,lo) = nd

        if (int_temp(nd,la,lo) .ge. mhw_5day_int(la,lo)) then
         mhw_5day_int(la,lo) = max(int_temp(nd:nd+4,la,lo))
         aa = ind(int_temp(:,la,lo) .eq. mhw_5day_int(la,lo))
         if (aa(0) .ge. nd .and. aa(0) .le. nd+4) then
          temp_int_ind = aa(0)
         else
          temp_int_ind = aa(1)
         end if
         mhw_5day_clm(la,lo) = clim_temp(temp_int_ind,la,lo)
         delete(aa)
        end if
      end if

     else

      if(.not.(ismissing(xx_summer(nd-1,la,lo))) .and. .not.(ismissing(xx_summer(nd,la,lo))) .and. .not.(ismissing(xx_summer(nd+1,la,lo))) .and. .not.(ismissing(xx_summer(nd+2,la,lo))) .and. .not.(ismissing(xx_summer(nd+3,la,lo))) .and. .not.(ismissing(xx_summer(nd+4,la,lo))) .and.\
        xx_summer(nd-1,la,lo).lt.thres(nd-1,la,lo) .and. xx_summer(nd,la,lo).ge.thres(nd,la,lo) .and. xx_summer(nd+1,la,lo).ge.thres(nd+1,la,lo) .and. xx_summer(nd+2,la,lo).ge.thres(nd+2,la,lo) .and. xx_summer(nd+3,la,lo).ge.thres(nd+3,la,lo) .and. xx_summer(nd+4,la,lo).ge.thres(nd+4,la,lo)) then
        hw = hw+1
        exx(nd,la,lo) = nd

        if (int_temp(nd,la,lo) .ge. mhw_5day_int(la,lo)) then
         mhw_5day_int(la,lo) = max(int_temp(nd:nd+4,la,lo))
         aa = ind(int_temp(:,la,lo) .eq. mhw_5day_int(la,lo))
         if (aa(0) .ge. nd .and. aa(0) .le. nd+4) then
          temp_int_ind = aa(0)
         else
          temp_int_ind = aa(1)
         end if
         mhw_5day_clm(la,lo) = clim_temp(temp_int_ind,la,lo)
         delete(aa)
        end if
      end if

      if(.not.(ismissing(xx_summer(nd,la,lo))) .and. .not.(ismissing(xx_summer(nd+1,la,lo))) .and. .not.(ismissing(xx_summer(nd+2,la,lo))) .and. .not.(ismissing(xx_summer(nd+3,la,lo))) .and. .not.(ismissing(xx_summer(nd+4,la,lo))) .and.\
        xx_summer(nd,la,lo).ge.thres(nd,la,lo) .and. xx_summer(nd+1,la,lo).ge.thres(nd+1,la,lo) .and. xx_summer(nd+2,la,lo).ge.thres(nd+2,la,lo) .and. xx_summer(nd+3,la,lo).ge.thres(nd+3,la,lo) .and. xx_summer(nd+4,la,lo).ge.thres(nd+4,la,lo)) then
        exx(nd,la,lo) = nd
        if (int_temp(nd,la,lo) .ge. mhw_5day_int(la,lo)) then
         mhw_5day_int(la,lo) = max(int_temp(nd:nd+4,la,lo))
         aa = ind(int_temp(:,la,lo) .eq. mhw_5day_int(la,lo))
         if (aa(0) .ge. nd .and. aa(0) .le. nd+4) then
          temp_int_ind = aa(0)
         else
          temp_int_ind = aa(1)
         end if
         mhw_5day_clm(la,lo) = clim_temp(temp_int_ind,la,lo)
         delete(aa)
        end if
      end if

        if(.not.(ismissing(xx_summer(nd-1,la,lo))) .and. .not.(ismissing(xx_summer(nd,la,lo))) .and. .not.(ismissing(xx_summer(nd+1,la,lo))) .and. .not.(ismissing(xx_summer(nd+2,la,lo))) .and. .not.(ismissing(xx_summer(nd+3,la,lo))) .and. \
        xx_summer(nd-1,la,lo).ge.thres(nd-1,la,lo) .and. xx_summer(nd,la,lo).ge.thres(nd,la,lo) .and. xx_summer(nd+1,la,lo).ge.thres(nd+1,la,lo) .and. xx_summer(nd+2,la,lo).ge.thres(nd+2,la,lo) .and. xx_summer(nd+3,la,lo).ge.thres(nd+3,la,lo)) then

        if (int_temp(nd,la,lo) .ge. mhw_5day_int(la,lo)) then
         mhw_5day_int(la,lo) = max(int_temp(nd:nd+4,la,lo))
         aa = ind(int_temp(:,la,lo) .eq. mhw_5day_int(la,lo))
         if (aa(0) .ge. nd .and. aa(0) .le. nd+4) then
          temp_int_ind = aa(0)
         else
          temp_int_ind = aa(1)
         end if
         mhw_5day_clm(la,lo) = clim_temp(temp_int_ind,la,lo)
         delete(aa)
        end if
      end if
     end if
    end do ; nd

    mhw_5day_fre(la,lo) = hw
    hw = 0  ; reset hw number

   end do ; lon
  end do ; lat

  do la = 0,nlat-1
   do lo = 0,nlon-1
    mhw_5day_dur(la,lo) = num(.not.ismissing(exx(:,la,lo)))+mhw_5day_fre(la,lo)*4
   end do ; lon
  end do ; lat

  copy_VarCoords(xx_summer(0,:,:), mhw_5day_fre)
  copy_VarCoords(xx_summer(0,:,:), mhw_5day_dur)
  copy_VarCoords(xx_summer(0,:,:), mhw_5day_int)
  copy_VarCoords(xx_summer(0,:,:), mhw_5day_clm)


  print("5 day end")

  fout = addfile(dir+"JAS_90percentile/MHW_90percentile_JAS_"+yy+".nc","c")

  fout->mhw_5day_fre = mhw_5day_fre
  fout->mhw_5day_dur = mhw_5day_dur
  fout->mhw_5day_int = mhw_5day_int
  fout->mhw_5day_clm = mhw_5day_clm

 end do

end
