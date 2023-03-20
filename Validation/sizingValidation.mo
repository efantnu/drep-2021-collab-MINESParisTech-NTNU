model sizingValidation
  "Demonstrates the usage of a Continuous.LimPID controller"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Angle driveAngle=1.570796326794897
    "Reference distance to move";
  Modelica.Blocks.Continuous.LimPID govGTs(
    
    Ni=0.1,
    Td= 0.18,
    Ti= 36,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    initType=Modelica.Blocks.Types.InitPID.InitialState,k= 28300000 / 157.08 / 1.5708,
    limiter(u(start = 0)),
    limitsAtInit=false, withFeedForward = false, yMax = 67500000 / 157.08, yMin = 0, y_start = 0) annotation (Placement(visible = true, transformation(extent = {{-142, -28}, {-122, -8}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(
    
    J= 10490 * 3,
    a(fixed = false),phi(fixed = false), w(fixed = true, start = 157.08)) annotation (Placement(visible = true, transformation(extent = {{66, -20}, {86, 0}}, rotation = 0)));

  Modelica.Mechanics.Rotational.Sources.Torque torqueGen annotation (Placement(
        visible = true, transformation(extent = {{25, -20}, {45, 0}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
      Placement(visible = true, transformation(extent = {{140, -60}, {120, -40}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add3 annotation(
    Placement(visible = true, transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant wSP(k = 157.08)  annotation(
    Placement(visible = true, transformation(origin = {-228, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp PVramp(duration = 19, height = -27700000, offset = 0, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-172, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torqueLoad annotation(
    Placement(visible = true, transformation(extent = {{131, 64}, {151, 84}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {104, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {32, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-46, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {-46, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID Batt(Ni = 0.1, Td = 0.1, Ti = 0.1, controllerType = Modelica.Blocks.Types.SimpleController.P, initType = Modelica.Blocks.Types.InitPID.InitialState, k = 10800000 / 1.5708, limiter(u(start = 0)), limitsAtInit = false, yMax = 10800000, yMin = -10800000, y_start = 0) annotation(
    Placement(visible = true, transformation(extent = {{-182, 2}, {-162, 22}}, rotation = 0)));
  Modelica.Blocks.Discrete.UnitDelay unitDelay(samplePeriod = 0.01, y_start = 157.08)  annotation(
    Placement(visible = true, transformation(origin = {98, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain GTs(k = 157.08)  annotation(
    Placement(visible = true, transformation(origin = {36, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain freq(k = 50 /157.08) annotation(
    Placement(visible = true, transformation(origin = {34, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add PVGTLoss annotation(
    Placement(visible = true, transformation(origin = {-94, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step GTloss(height = -22500000, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-172, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder GTdelay(T = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-94, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain freqLim(k = 49.5 / 157.08) annotation(
    Placement(visible = true, transformation(origin = {-168, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-138, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-138, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(torqueGen.flange, inertia1.flange_a) annotation(
    Line(points = {{45, -10}, {66, -10}}));
  connect(speedSensor.flange, inertia1.flange_b) annotation(
    Line(points = {{140, -50}, {140, -10}, {86, -10}}));
  connect(add3.y, torqueGen.tau) annotation(
    Line(points = {{15, -10}, {23, -10}}, color = {0, 0, 127}));
  connect(wSP.y, govGTs.u_s) annotation(
    Line(points = {{-217, -18}, {-144, -18}}, color = {0, 0, 127}));
  connect(const1.y, division.u1) annotation(
    Line(points = {{43, 78}, {92, 78}}, color = {0, 0, 127}));
  connect(division.y, torqueLoad.tau) annotation(
    Line(points = {{115, 72}, {122, 72}, {122, 74}, {129, 74}}, color = {0, 0, 127}));
  connect(torqueLoad.flange, inertia1.flange_b) annotation(
    Line(points = {{152, 74}, {160, 74}, {160, -15}, {86, -15}, {86, -10}}));
  connect(division2.y, add3.u2) annotation(
    Line(points = {{-35, 6}, {-26, 6}, {-26, -10}, {-8, -10}}, color = {0, 0, 127}));
  connect(wSP.y, Batt.u_s) annotation(
    Line(points = {{-217, -18}, {-204, -18}, {-204, 12}, {-184, 12}}, color = {0, 0, 127}));
  connect(speedSensor.w, unitDelay.u) annotation(
    Line(points = {{120, -50}, {110, -50}}, color = {0, 0, 127}));
  connect(unitDelay.y, division.u2) annotation(
    Line(points = {{88, -50}, {58, -50}, {58, 66}, {92, 66}}, color = {0, 0, 127}));
  connect(unitDelay.y, division2.u2) annotation(
    Line(points = {{88, -50}, {-72, -50}, {-72, 0}, {-58, 0}}, color = {0, 0, 127}));
  connect(unitDelay.y, division1.u2) annotation(
    Line(points = {{88, -50}, {-72, -50}, {-72, 72}, {-58, 72}}, color = {0, 0, 127}));
  connect(unitDelay.y, govGTs.u_m) annotation(
    Line(points = {{88, -50}, {-132, -50}, {-132, -30}}, color = {0, 0, 127}));
  connect(unitDelay.y, Batt.u_m) annotation(
    Line(points = {{88, -50}, {-172, -50}, {-172, 0}}, color = {0, 0, 127}));
  connect(division1.y, add3.u1) annotation(
    Line(points = {{-35, 78}, {-16, 78}, {-16, -2}, {-8, -2}}, color = {0, 0, 127}));
  connect(Batt.y, division2.u1) annotation(
    Line(points = {{-161, 12}, {-58, 12}}, color = {0, 0, 127}));
  connect(unitDelay.y, freq.u) annotation(
    Line(points = {{88, -50}, {2, -50}, {2, -76}, {22, -76}}, color = {0, 0, 127}));
  connect(govGTs.y, GTdelay.u) annotation(
    Line(points = {{-120, -18}, {-106, -18}}, color = {0, 0, 127}));
  connect(wSP.y, freqLim.u) annotation(
    Line(points = {{-216, -18}, {-204, -18}, {-204, -74}, {-180, -74}}, color = {0, 0, 127}));
  connect(PVGTLoss.y, division1.u1) annotation(
    Line(points = {{-83, 84}, {-58, 84}}, color = {0, 0, 127}));
  connect(GTdelay.y, add3.u3) annotation(
    Line(points = {{-82, -18}, {-8, -18}}, color = {0, 0, 127}));
  connect(GTdelay.y, GTs.u) annotation(
    Line(points = {{-82, -18}, {-26, -18}, {-26, -106}, {24, -106}}, color = {0, 0, 127}));
  connect(PVramp.y, firstOrder.u) annotation(
    Line(points = {{-160, 54}, {-150, 54}}, color = {0, 0, 127}));
  connect(firstOrder.y, PVGTLoss.u2) annotation(
    Line(points = {{-126, 54}, {-120, 54}, {-120, 78}, {-106, 78}}, color = {0, 0, 127}));
  connect(firstOrder1.y, PVGTLoss.u1) annotation(
    Line(points = {{-126, 90}, {-106, 90}}, color = {0, 0, 127}));
  connect(GTloss.y, firstOrder1.u) annotation(
    Line(points = {{-160, 90}, {-150, 90}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-240, 100}, {160, -100}})),
    experiment(StopTime = 4),
    Documentation(info = "<html>

<p>
This is a simple drive train controlled by a PID controller:
</p>

<ul>
<li> The two blocks \"kinematic_PTP\" and \"integrator\" are used to generate
   the reference speed (= constant acceleration phase, constant speed phase,
   constant deceleration phase until inertia is at rest). To check
   whether the system starts in steady state, the reference speed is
   zero until time = 0.5 s and then follows the sketched trajectory.</li>

<li> The block \"PI\" is an instance of \"Blocks.Continuous.LimPID\" which is
   a PID controller where several practical important aspects, such as
   anti-windup-compensation has been added. In this case, the control block
   is used as PI controller.</li>

<li> The output of the controller is a torque that drives a motor inertia
   \"inertia1\". Via a compliant spring/damper component, the load
   inertia \"inertia2\" is attached. A constant external torque of 10 Nm
   is acting on the load inertia.</li>
</ul>

<p>
The PI controller settings included \"limitAtInit=false\", in order that
the controller output limits of 12 Nm are removed from the initialization
problem.
</p>

<p>
The PI controller is initialized in steady state (initType=SteadyState)
and the drive shall also be initialized in steady state.
However, it is not possible to initialize \"inertia1\" in SteadyState, because
\"der(inertia1.phi)=inertia1.w=0\" is an input to the PI controller that
defines that the derivative of the integrator state is zero (= the same
condition that was already defined by option SteadyState of the PI controller).
Furthermore, one initial condition is missing, because the absolute position
of inertia1 or inertia2 is not defined. The solution shown in this examples is
to initialize the angle and the angular acceleration of \"inertia1\".
</p>

<p>
In the following figure, results of a typical simulation are shown:
</p>

<img src=\"modelica://Modelica/Resources/Images/Blocks/PID_controller.png\"
   alt=\"PID_controller.png\"><br>

<img src=\"modelica://Modelica/Resources/Images/Blocks/PID_controller2.png\"
   alt=\"PID_controller2.png\">

<p>
In the upper figure the reference speed (= integrator.y) and
the actual speed (= inertia1.w) are shown. As can be seen,
the system initializes in steady state, since no transients
are present. The inertia follows the reference speed quite good
until the end of the constant speed phase. Then there is a deviation.
In the lower figure the reason can be seen: The output of the
controller (PI.y) is in its limits. The anti-windup compensation
works reasonably, since the input to the limiter (PI.limiter.u)
is forced back to its limit after a transient phase.
</p>

</html>"),
    uses(Modelica(version = "3.2.3")),
  version = "");
end sizingValidation;
