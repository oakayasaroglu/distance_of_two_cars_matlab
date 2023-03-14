classdef carClass 
    properties 
        initial_velocity = 0; % km/h
        initial_position = 0; % m
        acceleration = []; % km/h^2
        velocity = []; % km/h
        position = []; % m
        velocityms = []; %m/s
    end
    methods
        function obj = carClass(initial_velocity, initial_position, ...
                                acceleration, velocity, position, velocityms)
            obj.initial_velocity = initial_velocity;
            obj.initial_position = initial_position;
            obj.acceleration = acceleration;
            obj.velocity = velocity;
            obj.position = position;
            obj.velocityms = velocityms;
        end
        
        function velocity_change = velocity_change_calc(obj,time)
            velocity_change = trapz(time,obj.acceleration(1:length(time)));
            return;
        end
        
        function converted_velocity = velocity_convert(obj)
            converted_velocity = obj.velocity*1000/3600;
            return;
        end
        
        function displacement = position_change_calc(obj,time)
            displacement = trapz(time,obj.velocityms(1:length(time)));
            return;
        end
    end
end