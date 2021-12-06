<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	{{-- <title>{{ env('APP_NAME') }}</title> --}}
	<title> TIRA | {{ $title }}</title>

	<!-- Global stylesheets -->
	{{-- <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css"> --}}
	<link href="{{ asset('assets/global/css/icons/icomoon/styles.min.css') }}" rel="stylesheet" type="text/css">
	<link href="{{ asset('assets/global/css/icons/material/styles.min.css') }}" rel="stylesheet" type="text/css">
	<link href="{{ asset('assets/global/css/icons/fontawesome/styles.min.css') }}" rel="stylesheet" type="text/css">
	<link href="{{ asset('assets/'.session('theme').'/css/all.min.css') }}" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script src="{{ asset('assets/global/js/main/jquery.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/main/jquery.printPage.js') }}"></script>
	<script src="{{ asset('assets/global/js/main/bootstrap.bundle.min.js') }}"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script src="{{ asset('assets/global/js/plugins/visualization/d3/d3.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/visualization/d3/d3_tooltip.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/ui/moment/moment.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/pickers/daterangepicker.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/tables/datatables/datatables.min.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/loaders/blockui.min.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/notifications/pnotify.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/demo_pages/extra_pnotify.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/notifications/sweet_alert.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/demo_pages/components_modals.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/forms/selects/select2.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/demo_pages/form_select2.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/forms/styling/uniform.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/forms/styling/switchery.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/forms/styling/switch.min.js') }}"></script>
	<script src="{{ asset('assets/js/components_checkbox_radios.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/pickers/pickadate/picker.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/pickers/pickadate/picker.time.js') }}"></script> 
	<script src="{{ asset('assets/global/js/plugins/pickers/picker_date.js') }}"></script>

	<script src="{{ asset('assets/global/js/demo_pages/form_input_groups.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/forms/tags/tokenfield.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/forms/inputs/touchspin.min.js') }}"></script>

	<script src="{{ asset('assets/global/js/plugins/forms/tags/tagsinput.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/forms/tags/tokenfield.min.js') }}"></script>
	<script src="{{ asset('assets/global/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js') }}"></script>
	{{-- <script src="{{ asset('assets/global/js/plugins/ui/prism.min.js') }}"></script> --}}
	<script src="{{ asset('assets/global/js/demo_pages/form_tags_input.js') }}"></script>

	<script type="text/javascript" src="{{ asset('assets/global/js/main/jquery.printPage.js')}}"></script>

	@yield('page_resources')

	<script src="{{ asset('assets/'.session('theme').'/js/app.js') }}"></script>
	<script src="{{ asset('js/custom.js') }}"></script>
	<!-- /theme JS files -->

	<style>
		.bg-telkom{
			background-color: #E74C3C!important;
		}
		.sidebar-light{
			background-color: #fff;
			color: rgb(3, 3, 3);
		}

		.text-body{
			color: #000!important;
		}

		.sidebar-light .nav-sidebar .nav-item-header {
			color: rgb(253 253 253 / 50%);
		}
	
		.sidebar-light .nav-sidebar .nav-link {
			color: rgb(20, 20, 20);
			font-size: 16px;
		}

		.sidebar-light .nav-sidebar>.nav-item>.nav-link.active {
			background-color: #e1cccc;
			color: #ef5350;
		}

		.nav-tabs-solid .nav-item.show .nav-link.active, .nav-tabs-solid .nav-link.active {
			color: #fff;
			background-color: #ef5350;
		}

		/* .form-control-filled {
			background-color: #ef5350;
			border-width: 0 0 1px 0;
			border-bottom-right-radius: 0;
			border-bottom-left-radius: 0;
		} */
	</style>
</head>

<body>

    @include('includes.main_navbar')
    @include('includes.page_header')
		

	<!-- Page content -->
	<div class="page-content">

        @include('includes.main_sidebar')


		<!-- Main content -->
		<div class="content-wrapper">
			<!-- Content area -->
			<div class="content">
                @yield('content')
			</div>
			<!-- /content area -->
		</div>
		<!-- /main content -->

		{{-- @include('includes.right_sidebar') --}}

	</div>
	<!-- /page content -->

	
	@include('includes.footer')
    @include('includes.notification')
	
</body>
@yield('page_js')
<script>
	$('document').ready(function(){
		@if(Session::has('pesan_pnotify'))
			new PNotify({
                title: '{{ session('pesan_pnotify.title') }}',
                type: '{{ session('pesan_pnotify.type') }}',
                text: '{!! session('pesan_pnotify.pesan') !!}',
                addclass: 'alert alert-styled-left',
            });
		@endif

		$('.select').select2({
			minimumResultsForSearch: Infinity,
		});
		
        $('.dataTables_length select').select2({
            minimumResultsForSearch: Infinity,
            width: 'auto'
		});
	});

	var swalInit = swal.mixin({
		buttonsStyling: false,
		confirmButtonClass: 'btn bg-success-700',
		cancelButtonClass: 'btn btn-light'
	});

	// $('.form-check-input-switch').bootstrapSwitch();
</script>

</html>
