function weight_quality_test ( )

%*****************************************************************************80
%
%% WEIGHT_QUALITY_TEST computes the weight quality of quadrature rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEIGHT_QUALITY_TEST\n' );
  fprintf ( 1, '  Determine the "weight quality" of nested quadrature rules\n' );
  fprintf ( 1, '  based on dyadic fractions and on Clenshaw-Curtis points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "quality" of a quadrature rule is the sum \n' );
  fprintf ( 1, '  the absolute value of the weights.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Nested                  Nested                  Nested\n' );
  fprintf ( 1, '           CCC         CCC         CCO         CCO         CCOH        CCOH\n' );
  fprintf ( 1, '     N     Quality     Quality     Quality     Quality     Quality     Quality\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 32

    [ x, w ] = ccc_rule ( n );
    ccc_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ccc_nested_rule ( n );
    ccc_nested_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = cco_rule ( n );
    cco_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = cco_nested_rule ( n );
    cco_nested_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ccoh_rule ( n );
    ccoh_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ccoh_nested_rule ( n );
    ccoh_nested_quality = sum ( abs ( w ) ) / 2.0;

    fprintf ( 1, '  %4d  %10.4g  %10.4g  %10.4g  %10.4g  %10.4g  %10.4g\n', ...
      n, ccc_quality, ccc_nested_quality, cco_quality, cco_nested_quality, ccoh_quality, ccoh_nested_quality );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEIGHT_QUALITY_TEST\n' );
  fprintf ( 1, '  Determine the "weight quality" of nested quadrature rules\n' );
  fprintf ( 1, '  based on dyadic fractions and on Clenshaw-Curtis points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The "quality" of a quadrature rule is the sum \n' );
  fprintf ( 1, '  the absolute value of the weights.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '                       Nested                  Nested                  Nested\n' );
  fprintf ( 1, '           NCC         NCC         NCO         NCO         NCOH        NCOH\n' );
  fprintf ( 1, '     N     Quality     Quality     Quality     Quality     Quality     Quality\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 32

    [ x, w ] = ncc_rule ( n );
    ncc_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ncc_nested_rule ( n );
    ncc_nested_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = nco_rule ( n );
    nco_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = nco_nested_rule ( n );
    nco_nested_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ncoh_rule ( n );
    ncoh_quality = sum ( abs ( w ) ) / 2.0;

    [ x, w ] = ncoh_nested_rule ( n );
    ncoh_nested_quality = sum ( abs ( w ) ) / 2.0;

    fprintf ( 1, '  %4d  %10.4g  %10.4g  %10.4g  %10.4g  %10.4g  %10.4g\n', ...
      n, ncc_quality, ncc_nested_quality, nco_quality, nco_nested_quality, ncoh_quality, ncoh_nested_quality );

  end

  return
end

