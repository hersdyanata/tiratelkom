@extends('layouts.app')

@section('header')
    Dashboard
@endsection

@section('content')
    <!-- Main charts -->
     test
    <!-- /main charts -->

@endsection

@section('page_resources')
    <script src="{{ asset('assets/global/js/demo_pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/streamgraph.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/sparklines.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/lines.js') }}"></script>	
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/areas.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/donuts.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/bars.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/progress.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/heatmaps.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/pies.js') }}"></script>
    <script src="{{ asset('assets/global/js/demo_charts/pages/dashboard/light/bullets.js') }}"></script>
@endsection

@section('page_js')
    <script>
        
    </script>    
@endsection
