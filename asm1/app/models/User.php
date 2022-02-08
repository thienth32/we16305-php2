<?php
namespace App\Models;
class User extends BaseModel{
    protected $tableName = 'users';

    public function getRoleName(){
        $role = Role::where(['id', '=', $this->role_id])->first();
        return $role->name;
    }
}
?>