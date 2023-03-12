format bank

tolerance = 0.05;

t = 0:0.01:10;
step_size = 0.01; 

car1 = carClass(50, 0);  % 1. arabayı (gerideki) tanımladım 
car2 = carClass(50, 10); % 2. arabayı (öndeki) tanımladım

distances = [];
car1_velocities = [];
car2_velocities = [];

for i = 0:1000
    car1.position = car1.position_calculate(step_size);
    car2.position = car2.position_calculate(step_size);
    last_distance = car2.position - car1.position;
    distances = [distances,last_distance];
    car1_velocities = [car1_velocities, car1.velocity];
    car2_velocities = [car2_velocities, car2.velocity];
    if(i==20)
        car2.velocity = 75;
    elseif(is_in_range(20.00, last_distance, tolerance))
        car1.velocity = 75;
    end
end 

figure("Name","Hidromek Ödev")
subplot(2,1,1);
hold on
plot(t,car1_velocities,"LineWidth",3,"Color","blue")
plot(t,car2_velocities,"LineWidth",3,"Color","red")
title("Speed/Time Graph of the Cars")
xlim([0,3])
xlabel("time(seconds)","FontWeight","bold")
ylim([0,100])
ylabel("Velocity(km/h)","FontWeight","bold")
legend("Behind Car","Front Car","Location","southeast")
hold off

subplot(2,1,2);
plot(t,distances,"LineWidth",3,"Color",	"#EDB120")
title("Distance Graph Between Two Cars")
xlim([0,3])
xlabel("time(seconds)","FontWeight","bold")
ylim([5,22])
ylabel("Distance(meters)","FontWeight","bold")

function in_range = is_in_range(desired, distance, tolerance)
    in_range = distance>(desired-tolerance) && distance<(desired+tolerance);
    return;
end