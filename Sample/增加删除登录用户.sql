sp_grantlogin 'teacher\new002'

sp_revokelogin 'teacher\new002'


sp_dropuser sql003
sp_droplogin 'sql003'


sp_addrole 'myrole002'


sp_addrolemember 'myrole002','sql001'
sp_droprolemember 'myrole002','sql001'

grant select on ry to myrole002
deny select on ry to myrole002