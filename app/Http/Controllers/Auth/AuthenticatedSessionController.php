<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\MstUICModel as UIC;
use App\Models\CoreMenuModel as Menu;
use App\Models\CoreMenuDividerModel as Divider;
use App\Models\User as Users;
use App\Services\GrantedService;
use GuzzleHttp\Client;



class AuthenticatedSessionController extends Controller
{
    public $granted;
    public function __construct(GrantedService $granted){
        $this->granted = $granted;
    }
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {
        $url = config('app.api_ldap');

        $client = new Client();
        // $response = $client->request('POST', $url, [
        //     'username'  => $request->username,
        //     'password'  => $request->password,
        // ]);  

        // $response = $client->GET('https://auth.proman.id/services/auth?username='.$request->username.'&password='.$request->password.'');
 
        
        $data_json = $response->getBody()->getContents();
        echo $data_json;
        die; 

        $request->authenticate();
        $request->session()->regenerate();
        $this->set_permission($request);

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    public function set_permission($request){
        $userLogin  = Users::where('nik', $request->username)->first();
        if (isset($userLogin)){
            if($userLogin->group_id != 0){
                // $properties = $userLogin->permissions();
                $properties = $this->granted->usergroup_permission($userLogin->group_id);
                $dividers = $properties['dividers'];
                $menus = $properties['menus'];
                $permission = $properties['actions']['array_privileges'];
                $uicDesc = UIC::where('uic_id', $userLogin->uic_id)->pluck('uic_desc')->first();

                $arr_granted = array();
                foreach($menus as $r){
                    $arr_granted[$r['menu_route_name']] = array(
                        'menu_id' => $r['menu_id'],
                        'menu_name' => $r['menu_nama_ina'],
                        'menu_route' => $r['menu_route_name'],
                    );
                }
                
                $data = [
                    'user_id' => $userLogin->id,
                    'user_nik' => $userLogin->nik,
                    'user_name' => $userLogin->name,
                    'uic_id' => $userLogin->uic_id,
                    'uic_desc' => $uicDesc,
                    'group_id' => $userLogin->group_id,
                    'group_name' => $userLogin->group_nama,
                    'theme' => $userLogin->theme,
                    'granted_menu' => $arr_granted,
                    'all_menus' => $menus,
                    'dividers' => $dividers,
                    'permission' => $permission
                ];
            }else{
                $menus = Menu::orderBy('menu_div_id')
                        ->orderBy('menu_order')
                        ->get()->toArray();

                $divider = Divider::all()->toArray();

                $data = [
                    'all_menus' => $menus,
                    'dividers' => $divider,
                    'user_id' => $userLogin->id,
                    'group_id' => $userLogin->group_id,
                    'group_name' => 'Developer',
                    'theme' => $userLogin->theme,
                ];
            }

            session($data);
        }else{
            $this->destroy($request);
        }
    }

    public function username(){
        return 'username';
    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/login');
    }
}
