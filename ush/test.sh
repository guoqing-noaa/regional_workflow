#!/bin/bash

settings="\
  'extrn_mdl_sysbasedir_lbcs': "/public/data/grids/rap/full/wrfnat/grib2"
  'boundary_len_hrs': 21
  'boundary_long_len_hrs': 51
  'extrn_mdl_lbcs_offset_hrs': 0
  'bc_update_interval': 1
"
#
# Set the full path to the template rocoto XML file.  Then call a python
# script to generate the experiment's actual XML file from this template
# file.
#
template_xml_fp="./getextrn.xml"
WFLOW_XML_FP="./getextrn_new.xml"
./fill_jinja_template.py -q \
                               -u "${settings}" \
                               -t ${template_xml_fp} \
                               -o ${WFLOW_XML_FP}
