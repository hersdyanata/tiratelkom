<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/dashboard', function () {
//     return view('modules.dashboard.index');
// })->middleware(['auth'])->name('dashboard');

Route::get('dashboard', [App\Http\Controllers\DashboardController::class, 'index'])->name('dashboard.index');
Route::post('dashboard/extended_page', [App\Http\Controllers\DashboardController::class, 'extended_page'])->name('dashboard.extended_page');
Route::post('dashboard/filter_mom', [App\Http\Controllers\DashboardController::class, 'filter_mom'])->name('dashboard.filter_mom');

/* ======================================================================= Route List Core ======================================================================= */
Route::post('core/switch-theme', [App\Http\Controllers\CoreController::class, 'switchTheme'])->name('switch_theme');
Route::resource('core', App\Http\Controllers\CoreController::class);
Route::resource('menu-manager', App\Http\Controllers\CoreMenuController::class);
Route::post('menu-manager/list', [App\Http\Controllers\CoreMenuController::class, 'list_menu'])->name('menu-manager.list_menu');
Route::post('menu-manager/predelete', [App\Http\Controllers\CoreMenuController::class, 'predelete_menu'])->name('menu-manager.predelete');
Route::post('menu-manager/delete', [App\Http\Controllers\CoreMenuController::class, 'delete_menu'])->name('menu-manager.delete');
Route::post('menu-manager/set-order-menu', [App\Http\Controllers\CoreMenuController::class, 'set_order_menu'])->name('menu-manager.set_order_menu');
Route::post('menu-manager/set-order-divider', [App\Http\Controllers\CoreMenuController::class, 'set_order_divider'])->name('menu-manager.set_order_divider');
Route::post('menu-manager/divider/store', [App\Http\Controllers\CoreMenuController::class, 'simpan_divider'])->name('save_divider');
Route::post('menu-manager/divider/list', [App\Http\Controllers\CoreMenuController::class, 'list_divider'])->name('core.list_divider');
Route::post('menu-manager/divider/read', [App\Http\Controllers\CoreMenuController::class, 'read_divider'])->name('core.read_divider');
Route::post('menu-manager/divider/update', [App\Http\Controllers\CoreMenuController::class, 'update_divider'])->name('update_divider');
Route::post('menu-manager/divider/predelete', [App\Http\Controllers\CoreMenuController::class, 'predelete_divider'])->name('predelete_divider');
Route::post('menu-manager/divider/delete', [App\Http\Controllers\CoreMenuController::class, 'delete_divider'])->name('delete_divider');
Route::get('menu-manager/divider/options', [App\Http\Controllers\CoreMenuController::class, 'divider_options'])->name('core.options_divider');
Route::post('menu-manager/divider/menu', [App\Http\Controllers\CoreMenuController::class, 'list_menu_divider'])->name('core.menu_divider');

Route::resource('usergroup', App\Http\Controllers\UsergroupController::class);
Route::post('usergroup/list', [App\Http\Controllers\UsergroupController::class, 'list_usergroup'])->name('usergorup.list');
Route::post('usergroup/predelete', [App\Http\Controllers\UsergroupController::class, 'predelete'])->name('usergroup.predelete');
Route::post('usergroup/delete', [App\Http\Controllers\UsergroupController::class, 'delete'])->name('usergroup.delete');

Route::resource('user', App\Http\Controllers\UserController::class);
Route::post('user/list', [App\Http\Controllers\UserController::class, 'list_user'])->name('user.list');
Route::post('user/predelete', [App\Http\Controllers\UserController::class, 'predelete'])->name('user.predelete');
Route::post('user/delete', [App\Http\Controllers\UserController::class, 'delete'])->name('user.delete');
/* ======================================================================= Route List Core ======================================================================= */

Route::resource('mom', App\Http\Controllers\MomController::class);
Route::post('mom/create_agenda', [App\Http\Controllers\MomController::class, 'store_agenda'])->name('mom.create_agenda');
Route::post('mom/add_row_poin', [App\Http\Controllers\MomController::class, 'add_row_poin'])->name('mom.add_row_poin');
Route::post('mom/create_draft_mom', [App\Http\Controllers\MomController::class, 'create_draft_mom'])->name('mom.create_draft_mom');
Route::post('mom/store_draft_mom', [App\Http\Controllers\MomController::class, 'store_draft_mom'])->name('mom.store_draft_mom');



require __DIR__.'/auth.php';
