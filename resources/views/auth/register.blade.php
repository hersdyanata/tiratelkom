@extends('layouts.guest')
@section('bgcolor')
    bg-indigo
@endsection
@section('content')
    <!-- Centered inputs -->
    <div class="row">
        <div class="col-lg-7"></div>
        <div class="col-lg-5">
            <!-- Login card -->
            <form class="login-form" method="POST" action="{{ route('register') }}">
                @csrf
                {{-- <div class="card mb-0">
                    <div class="card-body"> --}}
                        <div class="text-left mb-3">
                            {{-- <i class="icon-plus3 icon-2x text-indigo border-indigo border-3 rounded-pill p-3 mb-3 mt-1"></i> --}}
                            <h1 class="mb-0 font-weight-bold"><i>Register New Account</i></h1>
                            {{-- <h4 class="d-block font-weight-bold">Complete the form below</h4> --}}
                            {{-- <h5 class="mb-0">- D A F T A R -</h5>
                            <span class="d-block text-muted">Lengkapi form dibawah ini</span> --}}
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input id="name" type="name" name="name" value="{{ old('name') }}" class="form-control" placeholder="Nama" autofocus style="background-color:#FFF5F4;">
                            <div class="form-control-feedback">
                                <i class="icon-user text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input id="email" type="email" name="email" value="{{ old('email') }}" class="form-control" placeholder="Email" required style="background-color:#FFF5F4;">
                            <div class="form-control-feedback">
                                <i class="icon-mention text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left"> 
                            <select class="form-control select" name="uic_id" id="uic_id" required style="background-color:#FFF5F4;">
                                <option value="" class="text-muted">Unit in Charge</option>
                                @foreach ($uic as $r)
                                    <option value="{{ $r->uic_id }}">{{ $r->uic_desc }}</option>
                                @endforeach
                            </select>
                            <div class="form-control-feedback">
                                <i class="icon-collaboration text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left"> 
                            <select class="form-control select" name="group_id" id="group_id" required style="background-color:#FFF5F4;">
                                <option value="" class="text-muted">User Group</option>
                                @foreach ($usergroup as $r)
                                    <option value="{{ $r->group_id }}">{{ $r->group_nama }}</option>
                                @endforeach
                            </select>
                            <div class="form-control-feedback">
                                <i class="icon-users4 text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required autocomplete="new-password" style="background-color:#FFF5F4;">
                            <div class="form-control-feedback">
                                <i class="icon-lock2 text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group form-group-feedback form-group-feedback-left">
                            <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" placeholder="Konfirmasi password" required style="background-color:#FFF5F4;">
                            <div class="form-control-feedback">
                                <i class="icon-lock2 text-muted"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-dark btn-block">daftar</button>
                        </div>

                        <div class="form-group text-center text-muted content-divider">
                            <span class="px-2">Sudah punya akun?</span>
                        </div>

                        <div class="form-group">
                            <a href="{{ route('login') }}" class="btn btn-danger btn-block">Login<i class="icon-arrow-right8 ml-2"></i></a>
                        </div>

                        <span class="form-text text-center text-muted">Dengan melanjutkan, berarti Anda telah menyetujui dan telah membaca <a href="#">Terms &amp; Conditions</a> and <a href="#">Cookie Policy</a></span>
                    {{-- </div>
                </div> --}}
            </form>
            <!-- /login card -->  
        </div>
    </div>
    <!-- /centered inputs -->  
@endsection
