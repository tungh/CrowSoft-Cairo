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
-- Function: sp_cols()

-- DROP FUNCTION sp_cols();

CREATE OR REPLACE FUNCTION sp_cols(IN tableName varchar, refcursor)
  RETURNS refcursor AS
$BODY$
DECLARE
v_leng_id integer;
BEGIN
        OPEN $2 FOR
        SELECT *
        FROM information_schema.columns
        WHERE table_name = lower(tableName);

        RETURN $2;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION sp_cols(varchar, refcursor)
  OWNER TO postgres;
