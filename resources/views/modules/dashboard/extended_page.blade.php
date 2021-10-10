<div class="col-lg-12">
    <h1 class="mb-0 font-weight-bold">
        {{ $title }}
    </h1>
    <div class="card">
        <div class="card-body">
            <input type="hidden" id="status_mom" value="{{ $status }}" readonly>
            <ul class="nav nav-tabs nav-tabs-solid nav-justified rounded">
                @foreach ($kategori as $k)
                    <li class="nav-item" {{ $visible }}>
                        <a href="#kategori{{ $k->category_id }}" class="nav-link rounded-left rounded-right {{ $k->category_default }}" data-toggle="tab" onclick="filter_mom('{{ $k->category_id }}')">
                            {{ $k->category_desc }}
                        </a>
                    </li>    
                @endforeach
            </ul>

            <div class="tab-content">
                @foreach ($kategori as $k)
                    <div class="tab-pane fade {{ ($k->category_default == 'active') ? 'show' : '' }} {{ $k->category_default }}" id="kategori{{ $k->category_id }}">
                        <div id="konten{{ $k->category_id }}"></div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</div>

<script>
    filter_mom('1');
    function filter_mom(kategori){
        $.ajax({
            type: "POST",
            url: "{{ route('dashboard.filter_mom') }}",
            data: {
                "_token": "{{ csrf_token() }}",
                "kategori_mom": kategori,
                "status_mom": $('#status_mom').val()
            },
            beforeSend: function(){
                big_loader_open('page');
            },
            success: function (s) {
                // console.log(s);
                $('#konten'+kategori).html(s);
            },
            complete: function(){
                big_loader_close('page');
            }
        });
    }
</script>