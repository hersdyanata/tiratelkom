<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\GlobalService;

class GlobalParamsController extends Controller
{
    public $core;
    public function __construct(){
        // 
    }

    public function get_category_mom(GlobalService $category){
        return $category->get_category_mom();
    }     
}