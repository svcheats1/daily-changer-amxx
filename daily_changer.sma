/*************************************
* Daily Mapcycle
*  by JustinHoMi
**************************************
* Ported by Burnzy
*  Visit www.burnsdesign.org
**************************************
*
* WARNING!!!!
* ===========
*   YOU MUST DISABLE NEXTMAP.AMX FOR THIS TO WORK!
*
*
* Allows you to specify a different map
* rotation for every day. Mapcycles.txt should
* be placed in addons/amxx/configs/daily_mapcycles
* And for daily_cfgs to be placed into
* addons/amxx/configs/daily_cfgs
* The cfgs should be started with the
* week days first three letters in the
* name.
*
* REMEMBER!:
* ==========
*  -the files in the daily_mapcycles folder should be .txt
*  -the files in the daily_cfgs folder should be .cfg
*
* Examples:
* =========
*  Sun.cfg
*  Wed.cfg
*  Fri.cfg
*
*   (Sun,Mon,Tue,Wed,Thu,Fri,Sat).cfg
*   (Sun,Mon,Tue,Wed,Thu,Fri,Sat).txt
*
* In the cfg's, u just put what cvars u want to apply for that day
* In the txt's, u just put the maps u want to be rotated though on that day
*    Example:
*       de_dust
*       de_aztec_cz
*       cs_assault_cz
* (u dont need .bsp)
*
* Changelog:
*  v1.3  karn tried to fix it ffs
*  v1.2, Make it .ini for map stuff
*  v1.1, Made it so that there is
*  v1.0, Initial Release
*************************************/

#include <amxmodx>
#include <amxmisc>

public plugin_init()
{
	register_plugin("Daily Changer", "1.3", "JustinHoMi & JGHG & Karn")
	new today[8], custompath[256], workpath[256]

	get_time("%a", today, 8)
	get_customdir(custompath, 255)

	format(workpath, 255, "%s/daily_mapcycles/%s.txt", custompath, today)
	set_cvar_string("mapcyclefile", workpath)

	format(workpath, 255, "%s/daily_cfgs/%s.cfg", custompath, today)
	set_cvar_string("mapchangecfgfile", workpath)
}
