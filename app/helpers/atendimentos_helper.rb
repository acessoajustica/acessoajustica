module AtendimentosHelper

  def waiting_progress_bar(atendimento)

    title = time_ago_in_words(atendimento.created_at)
    minutes_ago = ((Time.now - atendimento.created_at) / 60).round
    bar_attr = bar_attributes(minutes_ago)

    html = <<-HTML
      <div class="progress progress-striped active" title="#{title}">
        <div class="progress-bar progress-bar-#{ bar_attr[:bar_type] }" style="width: #{ bar_attr[:width] }%;" title="#{title}"></div>
      </div>
    HTML

    html.html_safe
  end

  private

  def bar_attributes(elapsed_time_in_minutes)
    bar_types = {
                  0..15 => "info",
                  16..30 => "success",
                  31..60 => "warning",
                  61..Float::INFINITY => "danger"
                }

    bar_type = bar_types.select {|range| range === elapsed_time_in_minutes }.values.first
    width = elapsed_time_in_minutes > 60? 100 : (elapsed_time_in_minutes.to_f / 60) * 100

    return { :bar_type => bar_type, :width => width }
  end


end
