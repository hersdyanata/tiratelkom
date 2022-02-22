@php
    $no = 0;
@endphp
@foreach ($agenda as $ra)
    @php
        $no++;
    @endphp
    <div class="row">
        <div class="col-xl-12">
            <h6 class="font-weight-bold"><i>{{ $no }}. {{ $ra->agenda_desc }}</i></h6>
            <div id="table_pointer_{{ $ra->agenda_id }}">
            </div>
        </div>
    </div> 

    <div class="row mt-2" id="btn_add_item_diskusi">
        <i class="icon-plus-circle2 ml-2 " onclick="append_row_{{ $ra->agenda_id }}()"></i>
    </div>

    <hr>

    <script>
        function append_row_{{ $ra->agenda_id }}(){
            $.ajax({
                type: "POST",
                url: "{{ route('mom.add_row_poin') }}",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "mom_id" : "{{ $ra->mom_id }}",
                    "agenda_id" : "{{ $ra->agenda_id }}"
                },
                beforeSend: function(){
                    small_loader_open('table_pointer_{{ $ra->agenda_id }}');
                },
                success: function (s) {   
                    $('#table_pointer_{{ $ra->agenda_id }}').append(s);
                },
                complete: function(){
                    small_loader_close('table_pointer_{{ $ra->agenda_id }}');
                },
                error: function(e){
                    sw_multi_error(e);
                }
            });
        } 
    </script>
@endforeach