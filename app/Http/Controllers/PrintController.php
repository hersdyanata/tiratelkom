<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\MstUICModel as UIC;

class PrintController extends Controller
{
      public function index()
      {
            $uic = UIC::all();
            return view('modules.test.uic')->with('uic', $uic);;
      }
      public function prnpriview()
      {
            $uic = UIC::all();
            return view('modules.test.printuic')->with('uic', $uic);;
      }
}