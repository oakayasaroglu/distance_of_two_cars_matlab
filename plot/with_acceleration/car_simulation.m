t = 0:0.01:10; % define the time in seconds

acc1_div = 5;
acc2_div = 2.110001;

car1 = carClass(0,0,0,0,0,0);
car1.initial_velocity = 50;
car1.initial_position = 10;
car1.acceleration = zeros(size(t));
car1.velocity = zeros(size(t));
car1.position = zeros(size(t));
car1.velocityms = zeros(size(t));

for i = 1:length(t)
    if t(i) <= 1
        car1.acceleration(i) = 0;
    elseif t(i) <= (1+acc1_div)
        car1.acceleration(i) = 25/acc1_div;
    else
        car1.acceleration(i) = 0;
    end
    car1.velocity(i) = car1.velocity_change_calc(t) + car1.initial_velocity;
    car1.velocityms(i) = car1.velocity(i)*1000/3600;
    car1.position(i) = car1.position_change_calc(t) + car1.initial_position;
end

car2 = carClass(0,0,0,0,0,0);
car2.initial_velocity = 50;
car2.initial_position = 0;
car2.acceleration = zeros(size(t));
car2.velocity = zeros(size(t));
car2.position = zeros(size(t));
car2.velocityms = zeros(size(t));

for i = 1:length(t)
    if t(i) <= 1+acc1_div-acc2_div
        car2.acceleration(i) = 0;
    elseif t(i) <= (1+acc1_div)
        car2.acceleration(i) = 25/acc2_div;
    else
        car2.acceleration(i) = 0;
    end
    car2.velocity(i) = car2.velocity_change_calc(t) + car2.initial_velocity;
    car2.velocityms(i) = car2.velocity(i)*1000/3600;
    car2.position(i) = car2.position_change_calc(t) + car2.initial_position;
end

figure("Name","Hidromek Ödev")
subplot(3,1,1);
hold on
plot(t,car1.acceleration,"LineWidth",3,"Color","blue")
plot(t,car2.acceleration,"LineWidth",3,"Color","red")
ylim([0 15])
title("Acceleration/Time Graph of the Cars")
xlabel("time(seconds)","FontWeight","bold")
ylabel("Acceleration(km/h^{2})","FontWeight","bold")
legend("Front Car","Behind Car","Location","southeast")
hold off

subplot(3,1,2);
hold on
plot(t,car1.velocity,"LineWidth",3,"Color","blue")
plot(t,car2.velocity,"LineWidth",3,"Color","red")
ylim([45 80])
title("Velocity/Time Graph of the Cars")
xlabel("time(seconds)","FontWeight","bold")
ylabel("Velocity(km/h)","FontWeight","bold")
legend("Front Car","Behind Car","Location","southeast")
hold off

distance = car1.position-car2.position;
subplot(3,1,3);
hold on
plot(t,distance,"LineWidth",3,"Color","black")
title("Distances Between the Cars Graph")
xlabel("time(seconds)","FontWeight","bold")
ylabel("Distance(meters)","FontWeight","bold")
hold off