function point_quality_test ( )

%*****************************************************************************80
%
%% POINT_QUALITY_TEST computes the point quality for quadrature rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
  ns = 500;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_QUALITY_TEST\n' );
  fprintf ( 1, '  Determine the "point quality" of nested quadrature rules\n' );
  fprintf ( 1, '  based on dyadic fractions and on Clenshaw-Curtis points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "point quality" of a quadrature rule is the maximum \n' );
  fprintf ( 1, '  absolute value of the Lagrange factor over the interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Nested                  Nested                  Nested\n' );
  fprintf ( 1, '     N     CCC         CCC         CCO         CCO         CCOH        CCOH\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 32

    xs = linspace ( -1.0, 1.0, ns );

    [ x, w ] = ccc_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ccc_quality = max ( abs ( ls ) );

    [ x, w ] = ccc_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ccc_nested_quality = max ( abs ( ls ) );

    [ x, w ] = cco_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    cco_quality = max ( abs ( ls ) );

    [ x, w ] = cco_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    cco_nested_quality = max ( abs ( ls ) );

    [ x, w ] = ccoh_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ccoh_quality = max ( abs ( ls ) );

    [ x, w ] = ccoh_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ccoh_nested_quality = max ( abs ( ls ) );

    fprintf ( 1, '  %4d  %10.4e  %10.4e  %10.4e  %10.4e  %10.4e  %10.4e\n', ...
      n, ccc_quality, ccc_nested_quality, cco_quality, cco_nested_quality, ccoh_quality, ccoh_nested_quality );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_QUALITY_TEST\n' );
  fprintf ( 1, '  Determine the "point quality" of nested quadrature rules\n' );
  fprintf ( 1, '  based on dyadic fractions and on Clenshaw-Curtis points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "point quality" of a quadrature rule is the maximum \n' );
  fprintf ( 1, '  absolute value of the Lagrange factor over the interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Nested                  Nested                  Nested\n' );
  fprintf ( 1, '     N     NCC         NCC         NCO         NCO         NCOH        NCOH\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 32

    xs = linspace ( -1.0, 1.0, ns );

    [ x, w ] = ncc_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ncc_quality = max ( abs ( ls ) );

    [ x, w ] = ncc_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ncc_nested_quality = max ( abs ( ls ) );

    [ x, w ] = nco_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    nco_quality = max ( abs ( ls ) );

    [ x, w ] = nco_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    nco_nested_quality = max ( abs ( ls ) );

    [ x, w ] = ncoh_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ncoh_quality = max ( abs ( ls ) );

    [ x, w ] = ncoh_nested_rule ( n );
    ls = lagrange_factor ( n, x, ns, xs );
    ncoh_nested_quality = max ( abs ( ls ) );

    fprintf ( 1, '  %4d  %10.4e  %10.4e  %10.4e  %10.4e  %10.4e  %10.4e\n', ...
      n, ncc_quality, ncc_nested_quality, nco_quality, nco_nested_quality, ncoh_quality, ncoh_nested_quality );

  end

  return
end

