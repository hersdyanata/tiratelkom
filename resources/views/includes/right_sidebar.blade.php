<!-- Right sidebar -->
<div class="sidebar bg-telkom sidebar-light sidebar-right sidebar-expand-lg align-self-start">

    <!-- Sidebar content -->
    <div class="sidebar-content">

        <!-- Header -->
        <div class="sidebar-section sidebar-section-body d-flex align-items-center pb-2">
            {{-- <h5 class="mb-0">Sidebar</h5> --}}
            <div class="ml-auto">
                <button type="button" class="btn btn-outline-light text-body border-transparent btn-icon rounded-pill btn-sm sidebar-mobile-right-toggle d-lg-none">
                    <i class="icon-cross2"></i>
                </button>
            </div>
        </div>
        <!-- /header -->

        <!-- Online users -->
        <div class="sidebar-section">
            <div class="sidebar-section-header">
                <h4 class="text-white">Open Assignments</h4>
                <div class="list-icons ml-auto text-white">
                    <a href="#sidebar-users" class="list-icons-item" data-toggle="collapse">
                        <i class="icon-arrow-down12"></i>
                    </a>
                </div>
            </div>

            <div class="collapse show" id="sidebar-users">
                <div class="sidebar-section-body">
                    <ul class="media-list">
                        <li class="media">
                            <a href="#" class="mr-3">
                                <img src="{{ asset('assets/global/images/placeholders/placeholder.jpg') }}" width="36"
                                    height="36" class="rounded-circle" alt="">
                            </a>
                            <div class="media-body">
                                <a href="#" class="media-title font-weight-bold text-white">James Alexander</a>
                                <span class="font-size-xs text-white d-block">Santa Ana, CA.</span>
                            </div>
                            {{-- <div class="ml-3 align-self-center">
                                <span class="badge badge-mark border-success"></span>
                            </div> --}}
                        </li>

                        <li class="media">
                            <a href="#" class="mr-3">
                                <img src="{{ asset('assets/global/images/placeholders/placeholder.jpg') }}" width="36"
                                    height="36" class="rounded-circle" alt="">
                            </a>
                            <div class="media-body">
                                <a href="#" class="media-title font-weight-bold text-white">Jeremy Victorino</a>
                                <span class="font-size-xs text-white d-block">Dowagiac, MI.</span>
                            </div>
                            {{-- <div class="ml-3 align-self-center">
                                <span class="badge badge-mark border-danger"></span>
                            </div> --}}
                        </li>

                        <li class="media">
                            <a href="#" class="mr-3">
                                <img src="{{ asset('assets/global/images/placeholders/placeholder.jpg') }}" width="36"
                                    height="36" class="rounded-circle" alt="">
                            </a>
                            <div class="media-body">
                                <a href="#" class="media-title font-weight-bold text-white">Margo Baker</a>
                                <span class="font-size-xs text-white d-block">Kasaan, AK.</span>
                            </div>
                            {{-- <div class="ml-3 align-self-center">
                                <span class="badge badge-mark border-success"></span>
                            </div> --}}
                        </li>

                        <li class="media">
                            <a href="#" class="mr-3">
                                <img src="{{ asset('assets/global/images/placeholders/placeholder.jpg') }}" width="36"
                                    height="36" class="rounded-circle" alt="">
                            </a>
                            <div class="media-body">
                                <a href="#" class="media-title font-weight-bold text-white">Beatrix Diaz</a>
                                <span class="font-size-xs text-white d-block">Neenah, WI.</span>
                            </div>
                            {{-- <div class="ml-3 align-self-center">
                                <span class="badge badge-mark border-warning"></span>
                            </div> --}}
                        </li>

                        <li class="media">
                            <a href="#" class="mr-3">
                                <img src="{{ asset('assets/global/images/placeholders/placeholder.jpg') }}" width="36"
                                    height="36" class="rounded-circle" alt="">
                            </a>
                            <div class="media-body">
                                <a href="#" class="media-title font-weight-bold text-white">Richard Vango</a>
                                <span class="font-size-xs text-white d-block">Grapevine, TX.</span>
                            </div>
                            {{-- <div class="ml-3 align-self-center">
                                <span class="badge badge-mark border-secondary"></span>
                            </div> --}}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /online-users -->
    </div>
    <!-- /sidebar content -->
</div>
<!-- /right sidebar -->