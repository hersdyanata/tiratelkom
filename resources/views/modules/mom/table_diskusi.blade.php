@php
    $no = 0;
@endphp
@foreach ($agenda as $r)
    @php
        $no++;
    @endphp
    <div class="row">
        <h6 class="font-weight-bold"><i>{{ $no }} {{ $r->agenda_desc }}</i></h6>
        <table class="table table-hover table-bordered" id="table_pointer">
            <thead>
                <tr>
                    <th class="text-center">#</th>
                    <th><i>Pointer</i></th>
                    <th><i>Assignment</i></th>
                    <th><i>UIC</i></th>
                    <th><i>Due Date</i></th>
                    <th><i>Priority</i></th>
                    <th><i>Status</i></th>
                </tr>
            </thead>
            <tbody id="body_poin"></tbody>
        </table>
    </div>

    <div class="row mt-2">
        <button type="button" class="btn btn-primary btn-sm" onclick="append_row_{{ $r->agenda_id }}()">
            <i class="icon-plus-circle2 ml-2"></i> Add Poin
        </button>
    </div>

    <hr>

    <script>
        function append_row_{{ $r->agenda_id }}(){
            $.ajax({
                type: "POST",
                url: "{{ route('mom.add_row_poin') }}",
                data: {
                    "_token": "{{ csrf_token() }}"
                },
                beforeSend: function(){
                    small_loader_open('table_pointer');
                },
                success: function (s) {   
                    $('#body_poin').append(s);
                },
                complete: function(){
                    small_loader_close('table_pointer');
                },
                error: function(e){
                    sw_multi_error(e);
                }
            });
        }
    </script>
@endforeach