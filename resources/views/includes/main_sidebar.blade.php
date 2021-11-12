<!-- Main sidebar -->
{{-- <div class="sidebar sidebar-light sidebar-main sidebar-expand-lg align-self-start"> --}}
<div class="sidebar sidebar-light sidebar-main sidebar-expand-lg align-self-start sidebar-main-resized">

    <!-- Sidebar content -->
    <div class="sidebar-content">

        <!-- Header -->
        <div class="sidebar-section sidebar-header">
            <div class="sidebar-section-body d-flex align-items-center justify-content-center pb-0">
                <h6 class="sidebar-resize-hide flex-1 mb-0">Navigation</h6>
                <div>
                    <button type="button" class="btn nav-link text-body border-transparent btn-icon rounded-pill btn-sm sidebar-control sidebar-main-resize d-none d-lg-inline-flex">
                        <i class="icon-transmission"></i>
                    </button>

                    <button type="button" class="btn nav-link text-body border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-main-toggle d-lg-none">
                        <i class="icon-cross2"></i>
                    </button>
                </div>
            </div>
        </div>
        <!-- /header -->


        <!-- User menu -->
        <div class="sidebar-section sidebar-user">
            <div class="sidebar-section-body d-flex justify-content-center">
                <a href="#">
                    <img src="{{ asset('assets/global') }}/images/placeholders/placeholder.jpg" class="rounded-circle" alt="">
                </a>

                <div class="sidebar-resize-hide flex-1 ml-3">
                    <div class="font-weight-semibold">{{ Auth::user()->name }}</div>
                    <div class="font-size-sm line-height-sm text-muted">{{ session('uic_desc') }}</div>
                    <div class="font-size-sm line-height-sm text-white">
                        {{ session('group_name') }}
                    </div>
                </div>
            </div>
        </div>					
        <!-- /user menu -->

        
        <!-- Main navigation -->
        @php
            $collection = collect(session('all_menus'));
        @endphp
        <div class="sidebar-section">
            <ul class="nav nav-sidebar" data-nav-type="accordion">
                @if (session('group_id') == '0')
                    <li class="nav-item-header"><div class="text-uppercase font-size-xs line-height-xs">Core</div> <i class="icon-menu" title="Core"></i></li>
                    <li class="nav-item nav-item-submenu {{ (Request::segment(1) === 'menu-manager') ? " nav-item-expanded nav-item-open" : "" }}">
                        <a href="#" class="nav-link"><i class="icon-code"></i> <span>Developer Builder</span></a>

                        <ul class="nav nav-group-sub" data-submenu-title="Layouts">
                            <li class="nav-item">
                                <a href="{{ route('menu-manager.index') }}" class="nav-link {{ (Request::segment(1) === 'menu-manager') ? "active" : "" }}" >
                                    Menu Manager
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif
                @include('includes.user_menu')
            </ul>
        </div>
        <!-- /main navigation -->
         
        <hr>
        <!-- Latest updates -->
        <div class="sidebar-section sidebar-resize-hide flex-1 mb-0">
            <div class="sidebar-section-header">
                <span class="font-weight-bold">Open Assignments</span>
                <div class="list-icons ml-auto">
                    <a href="#sidebar-updates" class="list-icons-item" data-toggle="collapse">
                        <i class="icon-arrow-down12"></i>
                    </a>
                </div>
            </div>
        
            <div class="collapse show" id="sidebar-updates">
                <div class="sidebar-section-body">
                    <ul class="media-list">
        
                        @forelse ($load_data_right_sidebar as $dt)
                            <li class="media">
                                <div class="media-body">
                                    <a href="{{ route('mom.edit_mom', $dt->discuss_mom_id) }}" class="media-title font-weight-bold">{{$dt->discuss_assignment}}</a>
                                    {{-- <span class="font-size-xs text-white d-block">{{$dt->discuss_assignment}}</span> --}}
                                    {{-- <div class="text-muted font-size-sm">4 minutes ago</div> --}}
                                </div> 
                            </li> 
                        @empty
                            <span class="text-muted font-size-xs d-block">no data found</span>
                        @endforelse    
                    </ul>
                </div>
            </div>
        </div>
        <!-- /latest updates -->

    </div>
    <!-- /sidebar content -->
    
</div>
<!-- /main sidebar -->