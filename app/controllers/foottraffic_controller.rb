class FoottrafficController < ApplicationController

        def index
          result = {}

          if params[:file]
                file= params[:file]

                File.open(file).each do |line|
                  parts = line.split

                  if parts.size == 4
                    customer_number = parts[0]
                    room_number = parts[1].to_i
                    direction = parts[2] == 'I' ? :in : :out
                    time = parts[3].to_i

                    result[room_number] ||= { visitor_count: 0, total_time: 0 }

                    if direction == :in
                      result[room_number][:total_time] -= time
                    else
                      result[room_number][:total_time] += (time + 1)
                      result[room_number][:visitor_count] += 1
                    end
                  end
                end
          end
          @r = result

        end



end
