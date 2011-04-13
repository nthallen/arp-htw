#ifndef CMDDATA_H_INCLUDED
#define CMDDATA_H_INCLUDED
/* CmdData.h defines data passed from command server to
   collection.
*/
typedef struct {
  unsigned short PV_SetP;
  unsigned short PV_Gi;
  unsigned short PV_Gp;
  unsigned char SW_St;
} CmdData_t;

/* SW_St Values */
#define SWS_READY 0
#define SWS_TAKEOFF 1
#define SWS_CRUISE 2
#define SWS_DESCEND 3
#define SWS_LAND 4

#define SWS_LASER_START 10
#define SWS_LASER_STOP 11
#define SWS_LASER_WAVE 12

#define SWS_PV_CLOSE 30
#define SWS_PV_STEPS 31
#define SWS_PV_PI 32
#define SWS_PV_SCAN 33

#define SWS_PDV_PI 35

#define SWS_READFILE 253
#define SWS_TIMEWARP 254
#define SWS_SHUTDOWN 255

#endif
