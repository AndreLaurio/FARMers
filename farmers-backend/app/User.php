<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use DB;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $primaryKey = 'user_id';
    protected $fillable = [
        'first_name', 'last_name', 'email', 'password', 'location', 'boundary', 'valid_id_type_id', 'valid_id_path', 'user_type_id', 'is_approved'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function scopeGetPendingAccounts(){
        $query = DB::table('users as u')
        ->leftJoin('cities as c', 'u.location', '=', 'c.city_id')
        ->where('u.is_approved',0)
        ->get();

        return $query;
    }
}
