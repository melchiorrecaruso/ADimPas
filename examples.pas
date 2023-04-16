{
  Description: ADimPas Test program.

  Copyright (C) 2023 Melchiorre Caruso <melchiorrecaruso@gmail.com>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
}

program examples;

uses
  Windows,
  ADim;

var
  side1, side2, side3, side4: TMeters;
  area: TSquareMeters;
  volume: TCubicMeters;
  hypervolume: TQuarticMeters;

  pressure: TPascals;
  stiffness: TNewtonsPerMeter;

  squarecharge: TSquareCoulombs;
  capacitance: TFarads;

  distance: TMeters;
  time: TSeconds;
  speed: TMetersPerSecond;
  acceleration: TMetersPerSquareSecond;
  density: TKilogramsPerCubicMeter;
  specificw: TNewtonsPerCubicMeter;
  force, normal: TNewtons;

  torque: TNewtonsMeter;
  work: TJoules;
  power: TWatts;

  charge: TCoulombs;
  potential: TVolts;
  current: TAmperes;

  flux: TWebers;
  fluxdensity: TTeslas;

  inductance: THenrys;
  resistance: TOhms;
  conductance: TSiemens;

  solidangle: TSteradians;
  intensity: TCandelas;
  luminousflux: TLumens;

  dose1: TSieverts;
  dose2: TGrays;

  squarevolt: TSquareVolts;
  squareamp: TSquareAmperes;

  angularspeed: TRadiansPerSecond;

  kA: double;
  kAr: TMeters;
  radius: TMeters;


  mass: TKilograms;
  eta: TPascalsSecond;

  mass1: TKilograms;
  mass2: TKilograms;
  GN: TNewtonsSquareMeterPerSquareKilogram;


  Cd: double;
  angle: TRadians;

  Uc: TJoules;
  Ug: TJoules;
  g: TMetersPerSquareSecond;

  Ue: TJoules;
  ke: TNewtonsPerMeter;

  kel: TNewtonsSquareMeterPerSquareCoulomb;
  q1: TCoulombs;
  q2: TCoulombs;
  Uel: TJoules;

  p: TKilogramsMeterPerSecond;
  impulse: TNewtonsSecond;

  flowrate: TCubicMetersPerSecond;

  lambda: TReciprocalKelvins;
  deltadist: TMeters;
  deltatemp: TKelvins;

  specificheatcapacity: TJoulesPerKilogramPerKelvin;
  heatcapacity: TJoulesPerKelvin;

  _m1: TKilograms;
  _m2: TKilograms;
  _tf: TKelvins;
  _t1: TKelvins;
  _t2: TKelvins;
  _c1: TJoulesPerKilogramPerKelvin;
  _c2: TJoulesPerKilogramPerKelvin;

  lambda2: TWattsPerMeterPerKelvin;

begin
  SetConsoleOutputCP(CP_UTF8);

  // area
  side1 := 10*m;
  side2 := 5*m;
  area  := side1*side2;
  side1 := area/side2;
  side2 := area/side1;

  writeln('*** Area:');
  writeln('The side-1 is: ', side1.ToString);
  writeln('The side-2 is: ', side2.ToString);
  writeln('The area is: ', area.ToString);
  writeln;

  // volume
  side1  := 10*m;
  side2  := 5*m;
  side3  := 2*m;
  volume := side1*side2*side3;
  side1  := volume/side2/side3;
  side2  := volume/side1/side3;
  side3  := volume/side1/side2;

  writeln('*** Volume:');
  writeln('The side-1 is: ', side1.ToString);
  writeln('The side-2 is: ', side2.ToString);
  writeln('The side-3 is: ', side3.ToString);
  writeln('The volume is: ', volume.ToString);
  writeln;

  // hyper volume
  side1 := 10*m;
  side2 := 5*m;
  side3 := 2*m;
  side4 := 7*m;
  hypervolume := side1*side2*side3*side4;
  side1 := hypervolume/side2/side3/side4;
  side2 := hypervolume/side1/side3/side4;
  side3 := hypervolume/side1/side2/side4;
  side4 := hypervolume/side1/side2/side3;

  writeln('*** Hyper volume:');
  writeln('The side-1 is: ', side1.ToString);
  writeln('The side-2 is: ', side2.ToString);
  writeln('The side-3 is: ', side3.ToString);
  writeln('The side-4 is: ', side4.ToString);
  writeln('The hyper volume is: ', hypervolume.ToString);
  writeln;

  // speed
  distance := 20*km;
  time     := 60*minute;
  speed    := distance/time;
  time     := distance/speed;
  distance := speed*time;

  writeln('*** Speed: v = distance / time');
  writeln('The distance is: ', distance.ToString);
  writeln('The time is: ', hr.From(time).ToString);
  writeln('The speed is: ', (km/hr).From(speed).ToString);
  writeln;

  // acceleration
  time         := 5*s;
  speed        := 100*(km/hr);
  acceleration := speed/time;
  time         := speed/acceleration;
  speed        := acceleration*time;

  writeln('*** Acceleration: a = speed / time');
  writeln('The speed is: ', (km/hr).From(speed).ToString);
  writeln('The time is: ', time.ToString);
  writeln('The acceleration is: ', (km/hr/s).From(acceleration).ToString);
  writeln;

  // force
  mass         := 5*kg;
  acceleration := 10*(m/s2);
  force        := mass*acceleration;
  mass         := force/acceleration;
  acceleration := force/mass;

  writeln('*** Force: F = mass * acceleration');
  writeln('The mass is: ', mass.ToString);
  writeln('The acceleration is: ', acceleration.ToString);
  writeln('The force is: ', force.ToString);
  writeln;

  // pressure
  force    := 10*N;
  area     := 5*m2;
  pressure := force/area;

  writeln('*** Pressure: P = force / area');
  writeln('The force is: ', force.ToString);
  writeln('The area: ', area.ToString);
  writeln('The pressure: ', pressure.ToString);
  writeln;

  // work
  force        := 10*N;
  distance     := 5*m;
  work         := force*distance;

  writeln('*** Work: W = force * distance');
  writeln('The force is: ', force.ToVerboseString);
  writeln('The distance is: ', distance.ToVerboseString);
  writeln('The work is: ', work.ToVerboseString);
  writeln;

  // power
  work  := 50*J;
  time  := 10*s;
  power := work/time;
  writeln('*** Power: P = work / time');
  writeln('The work is: ', work.ToVerboseString);
  writeln('The time is: ', time.ToVerboseString);
  writeln('The power is: ', power.ToVerboseString);
  writeln;

  // power
  torque       := 10*(N*m);
  angularspeed := 2*pi*(rad/s);
  power        := torque*angularspeed;

  writeln('*** Power: P = torque * angular speed');
  writeln('The torque is: ', torque.ToString(4, 0));
  writeln('The angular speed is: ', angularspeed.ToString(4, 0));
  writeln('The power is: ', power.ToString(4, 0));
  writeln;

  // volt (J/C)
  work      := 50*J;
  charge    := 25*C;
  potential := work/charge;

  writeln('*** Volt (J/C): V = work / charge');
  writeln('The work is: ', work.ToVerboseString);
  writeln('The charge is: ', charge.ToVerboseString);
  writeln('The potential is: ', potential.ToVerboseString);
  writeln;

  // volt (W/A)
  power     := 10*W;
  current   := 5*A;
  potential := power/current;

  writeln('*** Volt (W/A): V = power / current');
  writeln('The power is: ', power.ToVerboseString);
  writeln('The current is: ', current.ToVerboseString);
  writeln('The potential is: ', potential.ToVerboseString);
  writeln;

  // volt ((W*Ω)^0.5);
  power      := 10*W;
  resistance := 50*Ohm;
  squarevolt := power*resistance;

  writeln('*** Volt ((W*Ω)^0.5): V = square root (power / resistance)');
  writeln('The power is: ', power.ToVerboseString);
  writeln('The resistance is: ', resistance.ToVerboseString);
  writeln('The potential is: ', SquareRoot(squarevolt).ToString);
  writeln;

  // ampere ((W/Ω)^0.5);
  power      := 10*w;
  resistance := 50*Ohm;
  squareamp  := power/resistance;

  Writeln('*** Ampere ((W/Ω)^0.5):');
  writeln('The power is: ', power.ToVerboseString);
  writeln('The resistance is: ', resistance.ToVerboseString);
  writeln('The current is: ', SquareRoot(squareamp).ToVerboseString);
  writeln;

  // farad (C2/J)
  squarecharge := 25*C2;
  work         := 50*J;
  capacitance  := squarecharge/work;

  writeln('*** Farad (C2/J):');
  writeln('The charge is: ', SquareRoot(squarecharge).ToVerboseString);
  writeln('The work is: ', work.ToVerboseString);
  writeln('The capacitance is: ', capacitance.ToVerboseString);
  writeln;

  // farad (C/V)
  charge      :=  10*C;
  potential   :=  5*V;
  capacitance := charge/potential;

  writeln('*** Farad (C/V):');
  writeln('The charge is: ', charge.ToString);
  writeln('The potential is: ', potential.ToString);
  writeln('The capacitance is: ', capacitance.ToString);
  writeln;

  // weber
  potential := 5*V;
  time      := 10*s;
  flux      := potential*time;

  writeln('*** Weber:');
  writeln('The potential is: ', potential.ToString);
  writeln('The time is: ', time.ToString);
  writeln('The flux is: ', flux.ToVerboseString);
  writeln;

  // tesla
  flux        := 25*Wb;
  area        := 10*m2;
  fluxdensity := flux/area;

  writeln('*** Tesla:');
  writeln('The flux is: ', flux.ToVerboseString);
  writeln('The area is: ', area.ToVerboseString);
  writeln('The flux density is: ', fluxdensity.ToVerboseString);
  writeln;

  // henry
  flux       := 30*Wb;
  current    := 10*A;
  inductance := flux/current;

  writeln('*** Henry:');
  writeln('The flux is: ', flux.ToVerboseString);
  writeln('The current is: ', current.ToVerboseString);
  writeln('The inductance is: ', inductance.ToVerboseString);
  writeln;

  // siemens
  resistance  := 2*Ohm;
  conductance := 1/resistance;

  writeln('*** Siemens:');
  writeln('The resistance is: ', resistance.ToVerboseString);
  writeln('The conductance is: ', conductance.ToVerboseString);
  writeln;

  // coulomb
  current := 5*A;
  time    := 5*s;
  charge  := current*time;

  writeln('*** Coulomb:');
  writeln('The current is: ', current.ToVerboseString);
  writeln('The time is: ', time.ToVerboseString);
  writeln('The charge is: ', charge.ToVerboseString);
  writeln;

  // lumen
  intensity    := 10*ADim.cd;
  solidangle   := 90*sr;
  luminousflux := intensity*solidangle;

  writeln('*** Lumen:');
  writeln('The intensity is: ', intensity.ToVerboseString);
  writeln('The solidangle is: ', solidangle.ToVerboseString);
  writeln('The luminous flux is: ', luminousflux.ToVerboseString);
  writeln;

  // sievert & gray
  dose1 := 10*Sv;
  dose2 := 5*Gy;
//dose1 := 10*(m2/s2);
//dose2 := 10*(m2/s2);
  dose1 := 10*(j/kg);
  dose2 := 10*(j/kg);

  writeln('*** Sievert and Gray mixing:');
  writeln('The dose1 is: ', dose1.ToVerboseString);
  writeln('The dose2 is: ', dose2.ToVerboseString);
  writeln;

  // newton per meter
  force     := 50*N;
  distance  := 10*mm;
  stiffness := force/distance;

  writeln('*** Newton per meter:');
  writeln('The force is: ', force.ToString);
  writeln('The distance is: ', distance.ToString);
  writeln('The stiffness is: ', stiffness.ToString);
  writeln;

  // density
  mass          := 10*kg;
  volume        := 5*m3;
  density       := mass/volume;
  mass          := density*volume;
  volume        := mass/density;

  writeln('*** Density:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The volume is: ', volume.ToVerboseString);
  writeln('The density is: ', (ADim.kg/m3).From(density).ToVerboseString);
  writeln;

  // specific weight
  force     := 100*N;
  volume    := 10*m3;
  specificw := force/volume;
  force     := specificw*volume;
  volume    := force/specificw;

  writeln('*** Specific weight:');
  writeln('The force is: ', force.ToVerboseString);
  writeln('The volume is: ', volume.ToVerboseString);
  writeln('The specific weight is: ', specificw.ToVerboseString);
  writeln;

  // Sliding friction
  normal := 100*N;
  kA     := 0.05;
  force  := kA*normal;

  writeln('*** Sliding friction:');
  writeln('The normal force is: ', normal.ToVerboseString);
  writeln('The kA is: ', kA:0:3);
  writeln('The force is: ', force.ToVerboseString);
  writeln;

  // rolling friction
  normal := 100*N;
  kAr    := 0.0005*m;
  radius := 50*mm;
  force  := kAr*normal/radius;

  writeln('*** Rolling friction:');
  writeln('The normal force is: ', normal.ToVerboseString);
  writeln('The kAr is: ', kAr.ToVerboseString);
  writeln('The radius is: ', mm.From(radius).ToVerboseString);
  writeln('The force is: ', force.ToVerboseString);
  writeln;

  // viscosity force (laminar flow)
  eta    := 10*(Pa*s);
  radius := 20*mm;
  side1  := 1*m;
  area   := 2*pi*radius*side1;
  speed  := 0.5*(m/s);
  force  := eta*(speed/radius)*area;

  writeln('*** Viscosity (laminar flow):');
  writeln('The eta coefficent is: ', eta.ToVerboseString);
  writeln('The radius is: ', radius.ToVerboseString);
  writeln('The side1 is: ', side1.ToVerboseString);
  writeln('The area  is: ', area.ToVerboseString);
  writeln('The speed is: ', speed.ToVerboseString);
  writeln('The force is: ', force.ToVerboseString(4, 0));
  writeln;

  // drag force
  Cd      := 0.47;
  area    := 1000*mm2;
  speed   := 5*(m/s);
  density := 1.225*(kg/m3);
  force   := 0.5*Cd*(density*SquarePower(Speed))*area;

  writeln('*** Drag force:');
  writeln('The Cd coefficent is: ', Cd:0:3);
  writeln('The area is: ', area.ToVerboseString);
  writeln('The speed is: ', speed.ToVerboseString);
  writeln('The density is: ', density.ToVerboseString);
  writeln('The force is: ', force.ToVerboseString(4, 0));
  writeln;

  // angular speed
  angle        := 2*pi*rad;
  time         := 1*s;
  angularspeed := angle/time;
  radius       := 2*m;
  speed        := angularspeed*radius;

  writeln('*** Angular speed:');
  writeln('The angle is: ', angle.ToVerboseString(4, 0));
  writeln('The time is: ', time.ToVerboseString(4, 0));
  writeln('The angular speed is: ', angularspeed.ToVerboseString(4, 0));
  writeln('The radius is: ', radius.ToVerboseString);
  writeln('The tangential speed is: ', speed.ToVerboseString(4, 0));
  writeln;

  // centrifugal force
  mass         := 1*kg;
  angularspeed := 2*pi*(rad/s);
  radius       := 10*m;
  acceleration := (angularspeed*angularspeed)*radius;
  force        := mass*acceleration;

  writeln('*** Centrifugal force:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The angular speed is: ', angularspeed.ToVerboseString(4, 0));
  writeln('The radius is: ', radius.ToVerboseString);
  writeln('The acceleration is: ', acceleration.ToVerboseString(4, 0));
  writeln('The force is: ', force.ToVerboseString(4, 0));
  writeln;

  // universal gravitation law
  mass1    := 5.972E24*kg;
  mass2    := 7.348E22*kg;
  distance := 384400*km;
  GN       := 6.67E-11*(N*(m2/kg2));
  GN       := 6.67E-11*(N*m2/kg2);
  force    := GN*(mass1*mass2)/(distance*distance);

  writeln('*** Universal gravitation law:');
  writeln('The mass-1 is: ', mass1.ToVerboseString(4,0));
  writeln('The mass-2 is: ', mass2.ToVerboseString(4,0));
  writeln('The distance is: ', km.From(distance).ToVerboseString);
  writeln('The G is: ', GN.ToVerboseString);
  writeln('The force is: ', force.ToVerboseString(4, 0));
  writeln;

  // kinematic potential energy
  mass  := 10*kg;
  speed := 5*(m/s);
  Uc    := 1/2*mass*(speed*speed);

  writeln('*** Kinematic potential energy:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The speed is: ', speed.ToVerboseString);
  writeln('The potential energy is: ', Uc.ToVerboseString);
  writeln;

  // gravitational potential energy
  mass     := 10*kg;
  g        := 9.81*(m/s2);
  distance := 10*m;
  Ug       := mass*g*distance;

  writeln('*** Gravitational potential energy:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The g is: ', g.ToVerboseString(4, 0));
  writeln('The heigth is: ', distance.ToVerboseString);
  writeln('The gravitational potential energy is: ', Ug.ToVerboseString(4, 0));
  writeln;

  // elastic potential energy
  ke       := 10*(N/m);
  distance := 10*m;
  Ue       := 0.5*ke*(distance*distance);

  writeln('*** Elastic potential energy:');
  writeln('The ke is: ', ke.ToVerboseString);
  writeln('The distance is: ', distance.ToVerboseString);
  writeln('The Ue is: ', Ue.ToVerboseString);
  writeln;

  // electrostatic force
  kel      := 9E9*(N*m2/C2);
  q1       := 6E-6*C;
  q2       := 9E-6*C;
  distance := 2*m;
  force    := kel*(q1*q2)/(distance*distance);

  writeln('*** Electrostatic force:');
  writeln('The K.el is: ', kel.ToVerboseString(4, 0));
  writeln('The q1 is: ', q1.ToVerboseString);
  writeln('The q2 is: ', q2.ToVerboseString);
  writeln('The distance is: ', distance.ToVerboseString);
  writeln('The force is: ', force.ToVerboseString(4, 0));
  writeln;

  // electric potential energy
  Uel      := kel*(q1*q2/distance);
  writeln('*** Electric potential energy:');
  writeln('The electric potential energy is: ', Uel.ToVerboseString(4, 0));
  writeln;

  // momentum
  mass  := 10*kg;
  speed := 5*(m/s);
  p     := mass*speed;

  writeln('*** Momentum:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The speed is: ', speed.ToVerboseString);
  writeln('The momentum is: ', p.ToVerboseString);
  writeln;

  // impulse
  force   := 10*N;
  time    := 5*ms;
  impulse := p;
  impulse := force*time;

  writeln('*** Impulse:');
  writeln('The force is: ', force.ToVerboseString);
  writeln('The time is: ', ms.From(time).ToVerboseString);
  writeln('The impulse is: ', impulse.ToVerboseString);
  writeln;

  // Stevino's law
  density      := 10*(kg/m3);
  acceleration := 9.81*(m/s2);
  distance     := 2*m;
  pressure     := density*acceleration*distance;

  writeln('*** Stevino''s law:');
  writeln('The density is: ', density.ToVerboseString);
  writeln('The acceleration is: ', acceleration.ToVerboseString);
  writeln('The distance is: ', distance.ToVerboseString);
  writeln('The pressure is: ', pressure.ToVerboseString);
  writeln;

  // Archimede's law
  density      := 0.5*(kg/m3);
  acceleration := 9.81*(m/s2);
  volume       := 0.5*m3;
  force        := density*acceleration*volume;

  writeln('*** Archimede''s law:');
  writeln('The density is: ', density.ToVerboseString);
  writeln('The acceleration is: ', acceleration.ToVerboseString);
  writeln('The volume is: ', volume.ToVerboseString);
  writeln('The force is: ', force.ToVerboseString);
  writeln;

  // continuity equation (fluid)
  volume   := 50*m3;
  time     := 10*s;
  flowrate := volume/time;

  writeln('*** Continuity equation (fluid):');
  writeln('The volume is: ', volume.ToVerboseString);
  writeln('The time is: ', time.ToVerboseString);
  writeln('The mass flow rate is: ', flowrate.ToVerboseString);
  writeln;

  // Bernoulli's law
  density  := 5*(kg/m3);
  speed    := 5*(m/s);
  pressure := 1/2*density*(speed*speed);

  writeln('*** Bernoulli''s law:');
  writeln('The density is: ', density.ToVerboseString);
  writeln('The speed is: ', speed.ToVerboseString);
  writeln('The pressure is: ', pressure.ToVerboseString);
  writeln;

  acceleration := 9.81*(m/s2);
  distance     := 2*m;
  pressure     := density*acceleration*distance;

  writeln('The acceleration is: ', acceleration.ToVerboseString);
  writeln('The distance is: ', distance.ToVerboseString);
  writeln('The pressure is: ', pressure.ToVerboseString);
  writeln;

  // linear thermal expansion
  distance  := 10*m;
  lambda    := 1.2E-5*(1/K);
  deltatemp := 100*K;
  deltadist := distance*(lambda*deltatemp);

  writeln('*** Linear thermal expansion:');
  writeln('The L0 is: ', distance.ToVerboseString);
  writeln('The lambda is: ', lambda.ToVerboseString);
  writeln('The dT is: ', deltatemp.ToVerboseString);
  writeln('The DL is: ', deltadist.ToVerboseString);
  writeln;

  // heat capacity
  mass                 := 10*kg;
  specificheatcapacity := 7.5*(J/kg/K);
  heatcapacity         := mass*specificheatcapacity;

  writeln('*** Heat transfer:');
  writeln('The mass is: ', mass.ToVerboseString);
  writeln('The specific heat capacity is: ', specificheatcapacity.ToVerboseString);
  writeln('The thermal capacity is: ', heatcapacity.ToVerboseString);
  writeln;

  // calorimeter
  _m1 := 10*kg;
  _t1 := 100*K;
  _c1 := 7.5*(J/kg/K);
  _m2 := 10*kg;
  _t2 := 50*K;
  _c2 := 7.5*(J/kg/K);
  _tf := (_m1*_c1*_t1+_m2*_c2*_t2) / (_m1*_c1+_m2*_c2);

  writeln('*** Calorimeter:');
  writeln('The mass of body n.1 is: ', _m1.ToVerboseString);
  writeln('The temperature of body n.1 is: ', _t1.ToVerboseString);
  writeln('The specific heat capacity of body n.1 is: ', _c1.ToVerboseString);
  writeln;
  writeln('The mass of body n.2 is: ', _m2.ToVerboseString);
  writeln('The tempeerature of body n.2 is: ', _t2.ToVerboseString);
  writeln('The specific heat capacity of body n.2 is: ', _c2.ToVerboseString);
  writeln;
  writeln('The final temperature is: ', _tf.ToVerboseString);
  writeln;

  // thermal flux
  area      := 5*m2;
  side1     := 100*mm;
  lambda2   := 1.1*(W/m/K);
  deltatemp := 15*K;
  power     := lambda2*(deltatemp/side1)*area;

  writeln('*** Thermal flux:');
  writeln('The surface is: ', area.ToVerboseString);
  writeln('The width is: ', side1.ToVerboseString);
  writeln('The lambda is: ', lambda2.ToVerboseString);
  writeln('The deltatemp is: ', deltatemp.ToVerboseString);
  writeln('The power is: ', power.ToVerboseString);
  writeln;

  readln;
end.