
OBSPATH_NSSLMOSIAC=/public/data/radar/nssl/mrms/conus
FFG_DIR=/public/data/grids/ncep/ffg/grib2
AIRCRAFT_REJECT="/home/amb-verif/acars_RR/amdar_reject_lists"
SFCOBS_USELIST="/lfs4/BMC/amb-verif/rap_ops_mesonet_uselists"
SST_ROOT="/lfs4/BMC/public/data/grids/ncep/sst/0p083deg/grib2"
GVF_ROOT="/public/data/sat/ncep/viirs/gvf/grib2"

BERROR_FN="rrfs_glb_berror.l127y194.f77"

if [[ $MACHINE == "hera" ]] ; then

# for using RAP as boundary and initial
#  EXTRN_MDL_SOURCE_BASEDIR_ICS=/scratch2/BMC/public/data/grids/rap/full/wrfnat/grib2
#  EXTRN_MDL_SOURCE_BASEDIR_LBCS=/scratch2/BMC/public/data/grids/rap/full/wrfnat/grib2
# for using GFS as boundary and initial
  EXTRN_MDL_SOURCE_BASEDIR_ICS=/scratch2/BMC/public/data/grids/gfs/0p25deg/grib2
  EXTRN_MDL_SOURCE_BASEDIR_LBCS=/scratch2/BMC/public/data/grids/gfs/0p25deg/grib2
# observations
  OBSPATH=/scratch2/BMC/public/data/grids/rap/obs
  OBSPATH_NSSLMOSIAC=/scratch2/BMC/public/data/radar/nssl/mrms/conus
  LIGHTNING_ROOT=/scratch2/BMC/public/data/lightning
  ENKF_FCST=/scratch1/NCEPDEV/rstprod/com/gfs/prod
fi

if [[ $MACHINE == "wcoss2" ]] ; then
  EXTRN_MDL_SOURCE_BASEDIR_ICS=/lfs/h1/ops/prod/com/gfs/v16.2
  EXTRN_MDL_SOURCE_BASEDIR_LBCS=/lfs/h1/ops/prod/com/gfs/v16.2
  OBSPATH=/lfs/h1/ops/prod/com/obsproc/v1.0
  OBSPATH_NSSLMOSIAC=/lfs/h1/ops/prod/dcom/ldmdata/obs/upperair/mrms/conus/MergedReflectivityQC
  ENKF_FCST=/lfs/h1/ops/prod/com/gfs/v16.2
  SST_ROOT=/lfs/h1/ops/prod/com/gfs/v16.2
  GVF_ROOT=/lfs/h1/ops/prod/dcom/viirs
  IMSSNOW_ROOT=/lfs/h1/ops/prod/com/obsproc/v1.0
fi

# set up for retrospective test:
if [[ $DO_RETRO == "TRUE" ]] ; then

  if [[ $MACHINE == "jet" ]] ; then

    if [[ ${DO_ENSEMBLE} == "TRUE" ]]; then
       if [[ ${EXTRN_MDL_NAME_ICS} == "GEFS" ]]; then
         EXTRN_MDL_SOURCE_BASEDIR_ICS="/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/GEFS/public/pgrb2"
       elif [[ ${EXTRN_MDL_NAME_ICS} == "HRRRDAS" ]]; then
         EXTRN_MDL_SOURCE_BASEDIR_ICS="/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/HRRRE"
       elif [[ ${EXTRN_MDL_NAME_ICS} == "FV3GFS" ]]; then
         EXTRN_MDL_SOURCE_BASEDIR_ICS="/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/FV3GFS/0p25deg/grib2"
       fi
       if [[ ${EXTRN_MDL_NAME_LBCS} == "GEFS" ]]; then
         EXTRN_MDL_SOURCE_BASEDIR_LBCS="/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/GEFS/public/pgrb2"
       elif [[ ${EXTRN_MDL_NAME_LBCS} == "FV3GFS" ]]; then
         EXTRN_MDL_SOURCE_BASEDIR_LBCS="/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/FV3GFS/0p25deg/grib2"
       fi
       OBSPATH=/mnt/lfs4/HFIP/gsihyb/Chunhua.Zhou/data/obs
    else
       EXTRN_MDL_SOURCE_BASEDIR_ICS=/lfs1/BMC/wrfruc/grap/data/grap.netcdf
       EXTRN_MDL_SOURCE_BASEDIR_LBCS=/lfs1/BMC/wrfruc/grap/data/gfs_tmp
    fi

    OBSPATH=/lfs1/BMC/wrfruc/grap/data/obs_rap_tmp
    OBSPATH_NSSLMOSIAC=/lfs1/BMC/wrfruc/grap/data/refl_unzip/reflect
    LIGHTNING_ROOT=/lfs1/BMC/wrfruc/grap/data/lightning
    ENKF_FCST=/lfs1/BMC/wrfruc/grap/data/grap.ens
    AIRCRAFT_REJECT="/lfs1/BMC/wrfruc/grap/data/amdar_reject_lists"
    SFCOBS_USELIST="/lfs1/BMC/wrfruc/grap/data/mesonet_uselists"
    SST_ROOT="/lfs1/BMC/wrfruc/grap/data/highres_sst"
    GVF_ROOT="/lfs1/BMC/wrfruc/grap/data/gvf/grib2"
    IMSSNOW_ROOT="/lfs1/BMC/wrfruc/grap/data/snow/ims96/grib2"
    RAPHRR_SOIL_ROOT="/lfs1/BMC/wrfruc/grap/data/rap_hrrr_soil"
  fi
  if [[ $MACHINE == "hera" ]] ; then

    if [[ ${DO_ENSEMBLE} == "TRUE" ]]; then
      if [[ ${EXTRN_MDL_NAME_ICS} == "GEFS" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_ICS="/scratch1/BMC/wrfruc/chunhua/data/GEFS/pgrb2"
      elif [[ ${EXTRN_MDL_NAME_ICS} == "HRRRDAS" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_ICS="/scratch1/BMC/wrfruc/chunhua/data/HRRRDAS"
      elif [[ ${EXTRN_MDL_NAME_ICS} == "GDASENKF" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_ICS="/scratch1/BMC/wrfruc/chunhua/data/GDASENKF"
      fi
      if [[ ${EXTRN_MDL_NAME_LBCS} == "GEFS" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_LBCS="/scratch1/BMC/wrfruc/chunhua/data/GEFS/pgrb2"
      elif [[ ${EXTRN_MDL_NAME_LBCS} == "GDASENKF" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_LBCS="/scratch1/BMC/wrfruc/chunhua/data/GDASENKF"
      elif [[ ${EXTRN_MDL_NAME_LBCS} == "FV3GFS" ]]; then
        EXTRN_MDL_SOURCE_BASEDIR_LBCS="/scratch1/BMC/wrfruc/chunhua/data/FV3GFS"
      fi
      OBSPATH="/scratch1/BMC/wrfruc/chunhua/data/obs"
    else
#    EXTRN_MDL_SOURCE_BASEDIR_ICS=/scratch2/BMC/zrtrr/rli/data/hrrr/conus/wrfnat/grib2
#    EXTRN_MDL_SOURCE_BASEDIR_LBCS=/scratch2/BMC/zrtrr/rli/data/rap/full/wrfnat/grib2
      EXTRN_MDL_SOURCE_BASEDIR_ICS=/scratch2/BMC/zrtrr/rli/data/gfs/0p25deg/grib2
      EXTRN_MDL_SOURCE_BASEDIR_LBCS=/scratch2/BMC/zrtrr/rli/data/gfs/0p25deg/grib2
      OBSPATH=/scratch2/BMC/zrtrr/rli/data/obs_rap
    fi

    OBSPATH_NSSLMOSIAC=/scratch2/BMC/zrtrr/rli/data/reflectivity
    LIGHTNING_ROOT=/scratch2/BMC/zrtrr/rli/data/lightning
    ENKF_FCST=/scratch2/BMC/zrtrr/rli/data/enkf/atm
    AIRCRAFT_REJECT="/scratch2/BMC/zrtrr/rli/data/amdar_reject_lists"
    SFCOBS_USELIST="/scratch2/BMC/zrtrr/rli/data/mesonet_uselists"
    SST_ROOT="/scratch2/BMC/zrtrr/rli/data/highres_sst"
    GVF_ROOT="/scratch2/BMC/zrtrr/rli/data/gvf/grib2"
    IMSSNOW_ROOT="/scratch2/BMC/zrtrr/rli/data/snow/ims96/grib2"
    RAPHRR_SOIL_ROOT="/scratch2/BMC/zrtrr/rli/data/rap_hrrr_soil"
  fi
  if [[ $MACHINE == "orion" ]] ; then
    EXTRN_MDL_SOURCE_BASEDIR_ICS=/work/noaa/wrfruc/mhu/rrfs/data/gfs/0p25deg/grib2
    EXTRN_MDL_SOURCE_BASEDIR_LBCS=/work/noaa/wrfruc/mhu/rrfs/data/gfs/0p25deg/grib2
    OBSPATH=/work/noaa/wrfruc/mhu/rrfs/data/obs_rap
    OBSPATH_NSSLMOSIAC=/work/noaa/wrfruc/mhu/rrfs/data/reflectivity
    LIGHTNING_ROOT=/work/noaa/wrfruc/mhu/rrfs/data/lightning
    ENKF_FCST=/work/noaa/wrfruc/mhu/rrfs/data/enkf/atm
    AIRCRAFT_REJECT="/work/noaa/wrfruc/mhu/rrfs/data/amdar_reject_lists"
    SFCOBS_USELIST="/work/noaa/wrfruc/mhu/rrfs/data/mesonet_uselists"
    SST_ROOT="/work/noaa/wrfruc/mhu/rrfs/data/highres_sst"
    GVF_ROOT="/work/noaa/wrfruc/mhu/rrfs/data/gvf/grib2"
    IMSSNOW_ROOT="/work/noaa/wrfruc/mhu/rrfs/data/snow/ims96/grib2"
  fi
fi

# clean system
if [[ $DO_RETRO == "TRUE" ]] ; then
  CLEAN_OLDPROD_HRS="720"
  CLEAN_OLDLOG_HRS="720"
  CLEAN_OLDRUN_HRS="720"
  CLEAN_OLDFCST_HRS="720"
  CLEAN_OLDSTMPPOST_HRS="720"
  CLEAN_NWGES_HRS="720"
  if [[ $LBCS_ICS_ONLY == "TRUE" ]]; then
    CLEAN_OLDRUN_HRS="7777"
    CLEAN_OLDFCST_HRS="7777"
  fi
fi
