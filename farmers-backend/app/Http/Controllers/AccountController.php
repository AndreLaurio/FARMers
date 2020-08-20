<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class AccountController extends Controller
{
    public function getPendingAccount(){
        $pendingAccounts = User::where('is_approved',0)->get();
        return response()->json($pendingAccounts);
    }
    
    public function approveAccount(Request $request, $user_id){
        $approveAccount = User::find($user_id);
        $approveAccount->is_approved = $request->input('is_approved');
        $approveAccount->save();
    }
}
