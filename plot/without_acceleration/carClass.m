classdef carClass 
    properties 
        velocity = 50                                                       % unit = km/h
        position = 0                                                        % unit = m
    end
    methods
        function obj = carClass(velocity, position)
            obj.velocity = velocity;
            obj.position = position;
        end
        
        function meter_per_second = converted_velocity(obj)
            meter_per_second = obj.velocity*1000/3600;                      % km/h = 1000*m/3600*s
            return;
        end
        
        function pos = position_calculate(obj,step)
            pos =  obj.converted_velocity()*step + ...                      % v*t+... (km/h->m/s)
                   obj.position;                                            % last position
            return;
        end
    end
end