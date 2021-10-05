<tr>
    <td></td>    
    <td hidden>
        <input type="text" class="form-control" name="mom_id[{{$agenda->agenda_id}}]" id="mom_id_{{$agenda->mom_id}}" value="{{ $agenda->mom_id }}">
    </td>
    <td hidden>
        <input type="text" class="form-control" name="agenda_id[{{$agenda->agenda_id}}]" id="agenda_id{{$agenda->agenda_id}}" value="{{ $agenda->agenda_id }}">
    </td>
    <td>
        <input type="text" class="form-control" name="pointer[{{$agenda->agenda_id}}]" id="pointer">
    </td>
    <td>
        <input type="text" class="form-control" name="assignment[{{$agenda->agenda_id}}]" id="assignment">
    </td>
    <td>
        <input type="text" class="form-control" name="uic[{{$agenda->agenda_id}}]" id="uic">
    </td>
    <td>
        <input type="text" class="form-control daterange-single" name="due_date[{{$agenda->agenda_id}}]" id="due_date">
    </td>
    <td>
        <select class="form-control select" name="priority[{{$agenda->agenda_id}}]" id="priority">
            <option value="high">High</option>
            <option value="normal">Normal</option>
            <option value="low">low</option>
        </select>
    </td>
    <td>
        <select class="form-control select" name="status[{{$agenda->agenda_id}}]" id="status">
            <option value="open">Open</option>
            <option value="closed">Closed</option>
        </select>
    </td>
</tr>