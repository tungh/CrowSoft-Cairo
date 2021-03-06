/*
CrowSoft-Cairo
==============

ERP application written in Scala Play Framework and Postgresql

Copyright (C) 2012  Javier Mariano Alvarez

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

========================================================================

Created by Javier

http://www.crowsoft.com.ar

javier at crowsoft.com.ar
*/
-- Function: sp_sys_module_get()

-- DROP FUNCTION sp_sys_module_get();

CREATE OR REPLACE FUNCTION sp_sys_module_get(IN p_us_id integer, out rtn refcursor)
  RETURNS refcursor AS
$BODY$
DECLARE
BEGIN
        rtn := 'rtn';
        
        open rtn for
        select distinct 

			s.sysm_id,
			s.sysm_orden,
			s.sysm_objetoinicializacion,
			s.sysm_objetoedicion,
			s.pre_id

 	from sysModulo s inner join sysModuloUser u on s.sysm_id = u.sysm_id and u.us_id = p_us_id

	order by s.sysm_orden;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_sys_module_get(integer)
  OWNER TO postgres;
