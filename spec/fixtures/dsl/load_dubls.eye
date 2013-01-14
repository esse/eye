Eye.application "app1" do
  working_dir "/tmp"

  group "gr1" do
    process("p1"){ pid_file "app1-gr1-p1.pid" }
    process("p2"){ pid_file "app1-gr1-p2.pid" }
  end

  group "gr2" do
    chain :grace => 5.seconds
    process("q3"){ pid_file "app1-gr2-q3.pid" }
  end

  process("g4"){ pid_file "app1-g4.pid" }
  process("g5"){ pid_file "app1-g5.pid" }
  process("gr2and"){ pid_file "app1-gr2and.pid" }

end

Eye.application "app2" do
  working_dir "/tmp"

  process "z1" do
    pid_file "app2-z1.pid"
  end

  group "gr1" do
    process "z2" do
      pid_file "app2-gr1-z2.pid"
    end

    process "gr1and" do
      pid_file "app2-gr1-gr1and.pid"
    end
  end
end