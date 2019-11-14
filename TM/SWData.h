/* SWData.h */
#ifndef SWDATA_H_INCLUDED
#define SWDATA_H_INCLUDED

typedef struct __attribute__((__packed__)) {
  unsigned char SW_St;
  unsigned short PV_SetP;
  unsigned short PV_Gi;
  unsigned short PV_Gp;
} SWData_t;
extern SWData_t SWData;

#define SWS_TAKEOFF 1
#define SWS_CLIMB 2
#define SWS_DESCEND 3
#define SWS_LAND 4
#define SWS_LASER_START 10
#define SWS_LASER_STOP 11
#define SWS_LASER_WAVE 12
#define SWS_CALIBRATE_START 20
#define SWS_CALIBRATE_STOP 21
#define SWS_PV_CLOSE 30
#define SWS_PV_PI 32
#define SWS_PV_SCAN 33
#define SWS_READFILE 253
#define SWS_TIMEWARP 254
#define SWS_SHUTDOWN 255

#endif
