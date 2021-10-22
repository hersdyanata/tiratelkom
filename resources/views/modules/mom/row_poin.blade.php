 <tr>
    <td></td>    
    <td hidden>
        <input type="hidden" class="form-control" name="mom_id[]" value="{{ $agenda->mom_id }}">
    </td>
    <td hidden>
        <input type="hidden" class="form-control" name="agenda_id[]" value="{{ $agenda->agenda_id }}">
    </td>
    <td>
        <input type="text" class="form-control" name="pointer[]" id="pointer">
    </td>
    <td>
        <input type="text" class="form-control" name="assignment[]" id="assignment">
    </td>
    <td>
        {{-- <input type="text" class="form-control" name="uic[]" id="uic"> --}}
        <select multiple="multiple" class="form-control select" data-fouc data-container-css-class="select2-filled" name="uic[]" id="uic[]" >
            @foreach ($uics as $r)
                <option value="{{ $r->uic_id }}">{{ $r->uic_code }}</option>
            @endforeach
        </select>
    </td>
    <td>
        <input type="text" class="form-control daterange-single" name="due_date[]" id="due_date">
    </td>
    <td>
        <select class="form-control select" name="priority[]" id="priority">
            <option value="High">High</option>
            <option value="Normal">Normal</option>
            <option value="Low">Low</option>
        </select>
    </td>
    <td>
        <input type="text" class="form-control" name="progress[]" id="progress">
    </td>
    <td>
        <select class="form-control select" name="status[]" id="status">
            <option value="Open">Open</option>
            <option value="Closed">Closed</option>
        </select>
    </td>
</tr>
<script>
    $('.daterange-single').daterangepicker({
        parentEl: '.content-inner',
        singleDatePicker: true
    });

    $('.select').select2({
            minimumResultsForSearch: Infinity
        });
</script>  

