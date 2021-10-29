<?php

namespace App\Http\Views\Composers;

use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Services\Core;
use App\Services\MomService;
use Auth;

class BuildSideNavigatorComposer
{
    /**
     * The user repository implementation.
     *
     * @var \App\Repositories\UserRepository
     */
    protected $all_menus;
    protected $dividers;
    protected $page_permission;
    protected $load_data_right_sidebar;

    /**
     * Create a new profile composer.
     *
     * @param  \App\Repositories\UserRepository  $users
     * @return void
     */
    public function __construct(Request $request, MomService $mom)
    {
        $this->all_menus = session('all_menus');
        $this->page_permission = $request['page_permission'];
        $this->dividers = session('dividers');
        $this->load_data_right_sidebar = $mom->load_right_sidebar();
    }

    /**
     * Bind data to the view.
     *
     * @param  \Illuminate\View\View  $view
     * @return void
     */
    // public function compose(View $view)
    // {
    //     $view->with('user_menu', $this->core->list_menu());
    // }

    public function compose(View $view){
        if (Auth::check()) {
            $view->with([
                'dividers' => $this->dividers,
                'all_menus' => $this->all_menus,
                'page_permission' => $this->page_permission['perms'],
                'load_data_right_sidebar' => $this->load_data_right_sidebar,
            ]);
        }
    }
}