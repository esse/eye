class Eye::Trigger::CheckDependency < Eye::Trigger
  param :names, [Array], true, 5

  def check(transition)
    check_dependency(transition.to_name) if transition.from_name == :up
  end

private

  def check_dependency(to)
    # TODO: Alive array here
    processes = names.map { |name| Eye::Control.process_by_name(name) }.compact
    return if processes.empty?

    act = case to
      when :down, :restarting; :restart
      when :stopping; :stop
      when :unmonitored; :unmonitor
    end

    if act
      processes.each do |p|
        p.schedule act, Eye::Reason.new(:"#{act} dependecies")
      end
    end
  end

end
