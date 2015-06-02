function [ value, isterminal, direction ] = event_function ( t, y )

  value = y(1) - 0.99;
  isterminal = 1;
  direction = 0;

  return
end 
