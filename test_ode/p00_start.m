function [ t_start, y_start ] = p00_start ( test )

%*****************************************************************************80
%
%% P00_START returns the initial data for any test problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TEST, the test problem index.
%
%    Output, real T_START, the initial time.
%
%    Output, real Y_START(N), the initial value of the dependent
%    variables.
%
  if ( test == 1 )
    t_start = 0.0;
    y_start(1) = 1.0;
  elseif ( test == 2 )
    t_start = 0.0;
    y_start(1) = 1.0;
  elseif ( test == 3 )
    t_start = 0.0;
    y_start(1) = 1.0;
  elseif ( test == 4 )
    t_start = 0.0;
    y_start(1) = 1.0;
  elseif ( test == 5 )
    t_start = 0.0;
    y_start(1) = 4.0;
  elseif ( test == 6 )
    t_start = 0.0;
    y_start = [ 1.0, 3.0 ];
  elseif ( test == 7 )
    t_start = 0.0;
    y_start = [ 2.0, 0.0, 1.0 ];
  elseif ( test == 8 )
    t_start = 0.0;
    y_start = [ 1.0, 0.0, 0.0 ];
  elseif ( test == 9 )
    t_start = 0.0;
    y_start = [ 3.0, 0.0, 0.0 ];
  elseif ( test == 10 )
    t_start = 0.0;
    y_start = [ 0.0, 1.0, 1.0 ];
  elseif ( test == 11 )
    t_start = 0.0;
    y_start(1) = 1.0;
    y_start(2:10) = 0.0;
  elseif ( test == 12 )
    t_start = 0.0;
    y_start(1) = 1.0;
    y_start(2:10) = 0.0;
  elseif ( test == 13 )
    t_start = 0.0;
    y_start(1) = 1.0;
    y_start(2:10) = 0.0;
  elseif ( test == 14 )
    t_start = 0.0;
    y_start(1) = 1.0;
    y_start(2:51) = 0.0;
  elseif ( test == 15 )
    t_start = 0.0;
    y_start = [ ... 
     3.42947415189, ...
     3.35386959711, ...
     1.35494901715, ...
     6.64145542550, ...
     5.97156957878, ...
     2.18231499728, ...
    11.2630437207, ...
    14.6952576794, ...
     6.27960525067, ...
   -30.1552268759, ...
     1.65699966404, ...
     1.43785752721, ...
   -21.1238353380, ...
    28.4465098142, ...
    15.3882659679, ...
    -0.557160570446, ...
     0.505696783289, ...
     0.230578543901, ...
    -0.415570776342, ...
     0.365682722812, ...
     0.169143213293, ...
    -0.325325669158, ...
     0.189706021964, ...
     0.0877265322780, ...
    -0.0240476254170, ...
    -0.287659532608, ...
    -0.117219543175, ...
    -0.176860753121, ...
    -0.216393453025, ...
    -0.0148647893090 ];
  elseif ( test == 16 )
    t_start = 0.0;
    delta = p16_param ( 'GET', 'DELTA' );
    y_start(1) = 1.0 - delta;
    y_start(2) = 0.0;
    y_start(3) = 0.0;
    y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );
  elseif ( test == 17 )
    t_start = 0.0;
    delta = p17_param ( 'GET', 'DELTA' );
    y_start(1) = 1.0 - delta;
    y_start(2) = 0.0;
    y_start(3) = 0.0;
    y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );
  elseif ( test == 18 )
    t_start = 0.0;
    delta = p18_param ( 'GET', 'DELTA' );
    y_start(1) = 1.0 - delta;
    y_start(2) = 0.0;
    y_start(3) = 0.0;
    y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );
  elseif ( test == 19 )
    t_start = 0.0;
    delta = p19_param ( 'GET', 'DELTA' );
    y_start(1) = 1.0 - delta;
    y_start(2) = 0.0;
    y_start(3) = 0.0;
    y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );
  elseif ( test == 20 )
    t_start = 0.0;
    delta = p20_param ( 'GET', 'DELTA' );
    y_start(1) = 1.0 - delta;
    y_start(2) = 0.0;
    y_start(3) = 0.0;
    y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );
  elseif ( test == 21 )
    t_start = 0.0;
    y_start = [ 0.6713967071418030, 0.09540051444747446 ];
  elseif ( test == 22 )
    t_start = 0.0;
    y_start = [ 2.0, 0.0 ];
  elseif ( test == 23 )
    t_start = 0.0;
    y_start = [ 0.0, 0.0 ];
  elseif ( test == 24 )
    t_start = 0.0;
    y_start = [ 30.0, 0.0 ];
  elseif ( test == 25 )
    t_start = 0.0;
    y_start = [ 0.0, 0.0 ];
  elseif ( test == 26 )
    t_start = 0.0;
    y_start = [ 0.0, 0.0 ];
  elseif ( test == 27 )
    t_start = 0.0;
    y_start = 110.0;
  elseif ( test == 28 )
    t_start = 0.0;
    y_start = [ 0.0, 0.0 ];
  elseif ( test == 29 )
    t_start = 0.0;
    y_start = 1.0;
  elseif ( test == 30 )
    t_start = 0.0;
    y_start = 1.0;
  elseif ( test == 31 )
    t_start = 0.0;
    y_start = [ 2.0, 2.0 ];
  elseif ( test == 32 )
    t_start = 0.0;
    y_start = [ 2.0, 2.0, 21.0 ];
  elseif ( test == 33 )
    t_start = 0.0;
    y_start = [ 2.0, 2.0 ];
  elseif ( test == 34 )
    t_start = 0.0;
    y_start = [ 2.0, 2.0 ];
  elseif ( test == 35 )
    t_start = 0.0;
    y_start = [ 2.0, 2.0 ];
  elseif ( test == 36 )
    t_start = 0.0;
    y_start = [ 0.5, 0.0 ];
  elseif ( test == 37 )
    t_start = 0.0;
    y_start = [ 0.5, 0.0 ];
  elseif ( test == 38 )
    delta = p38_param ( 'GET', 'DELTA' );
    t_start = 0.0;
    y_start(1) = delta;
  elseif ( test == 39 )
    t_start = 0.0;
    y_start(1) = 0.5;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_START - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem index TEST = %d\n', test );
    error ( 'P00_START - Fatal error!' );
  end

  return
end
