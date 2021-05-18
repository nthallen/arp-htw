/* SWData.h */
#ifndef SWDATA_H_INCLUDED
#define SWDATA_H_INCLUDED

typedef struct __attribute__((__packed__)) {
  unsigned char SW_St;
  unsigned short PV_SetP;
  unsigned short PV_Gi;
  unsigned short PV_Gp;
  unsigned short GD_SetP;
  unsigned short GD_Gi;
  unsigned short GD_Gp;
  int16_t TV_DP_Set;
  int16_t TV_Gi;
  int16_t TV_Gp;
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
#define SWS_TV_INIT 40
#define SWS_TV_CLOSE 41
#define SWS_TV_SCAN 42
#define SWS_GD_INIT 50
#define SWS_GD_CLOSE 51
#define SWS_GD_FILL 52
#define SWS_GD_PUMP_PURGE 53
#define SWS_READFILE 253
#define SWS_TIMEWARP 254
#define SWS_SHUTDOWN 255

#endif
