<html>

<head>
    <link rel="stylesheet" href="{{ asset('assets/global/js/main/bootstrap.css')}}">

    <script type="text/javascript" src="{{ asset('assets/global/js/main/jquery.min.js')}}"></script>
    <script type="text/javascript" src="{{ asset('assets/global/js/main/jquery.printPage.js')}}"></script>
    <script type="text/javascript" src="{{ asset('assets/global/js/main/jquery-1.11.1.js')}}"></script>
    <script type="text/javascript" src="{{ asset('assets/global/js/main/printPreview.js')}}"></script>
</head>

<body>
    <div class="container">
        <div class="col-md-12">
            @yield('content')
        </div>
    </div>
</body>

</html>