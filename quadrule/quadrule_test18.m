function quadrule_test18 ( n )

%*****************************************************************************80
%
%% TEST18 compares LEGENDRE_EK_COMPUTE and LEGENDRE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST18\n' );
  fprintf ( 1, '  LEGENDRE_EK_COMPUTE computes Gauss-Legendre data;\n' );
  fprintf ( 1, '  LEGENDRE_SET looks up the same data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compare the data for N = %d\n', n );

  [ x1, w1 ] = legendre_ek_compute ( n );
  [ x2, w2 ] = legendre_set ( n );

  xdifmax = 0.0;
  ixdifmax = -1;

  wdifmax = 0.0;
  iwdifmax = -1;

  for i = 1 : n

    if ( xdifmax < abs ( x1(i) - x2(i) ) )
      xdifmax = abs ( x1(i) - x2(i) );
      ixdifmax = i;
    end

    if ( wdifmax < abs ( w1(i) - w2(i) ) )
      wdifmax = abs ( w1(i) - w2(i) );
      iwdifmax = i;
    end

  end

  if ( 0 < ixdifmax )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Maximum abscissa difference is %e\n', xdifmax );
    fprintf ( 1, '  for index I = %d\n', ixdifmax );
    fprintf ( 1, '  Computed:  %e\n', x1(ixdifmax) );
    fprintf ( 1, '  Stored:    %e\n', x2(ixdifmax) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The computed and stored abscissas are identical.\n' );
  end

  if ( 0 < iwdifmax )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Maximum w difference is %e\n', wdifmax );
    fprintf ( 1, '  for index I = %d\n', iwdifmax );
    fprintf ( 1, '  Computed:  %e\n', w1(iwdifmax) );
    fprintf ( 1, '  Stored:    %e\n', w2(iwdifmax) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The computed and stored weights are identical.\n' );
  end

  return
end
