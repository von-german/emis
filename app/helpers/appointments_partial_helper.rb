module AppointmentsPartialHelper
  def appointment_heading(appointment)
    if current_page?(appointment_path(appointment))
#can add doctor as third argument to content_tag
      content_tag(:h3, link_to(appointment.id) )
#    else
#      render partial: "appointments/appointment_short", locals: { appointment: appointment }
    end
  end

  def appointment_details(appointment)
    if current_page?(appointment_path(appointment))
      render partial: "appointments/appointment_details", locals: { appointment: appointment }
    end
  end

  def appointment_edit_delete_links(appointment)
    links = [link_to("Edit", edit_appointment_path(appointment) ),
    link_to("Delete", appointment, method: :delete, data: { confirm: "Are you sure you want to delete this appointment?" } )]
    safe_join(links, ", ")
  end
end
