function prob_test040 ( )

%*****************************************************************************80
%
%% TEST040 tests COUPON_SIMULATE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  n_trial = 10;
  max_type = 25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST040\n' );
  fprintf ( 1, '  COUPON_SIMULATE simulates the coupon \n' );
  fprintf ( 1, '  collector''s problem.\n' );
  fprintf ( 1, '\n' );

  for n_type = 5 : 5 : max_type

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of coupon types is %d\n', n_type );
    expect = n_type * log ( n_type );
    fprintf ( 1, '  Expected wait is about %f\n', expect );
    fprintf ( 1, '\n' );

    seed = 123456789;

    average = 0.0;
    for i = 1 : n_trial
      [ coupon, n_coupon, seed ] = coupon_simulate ( n_type, seed );
      fprintf ( 1, '  %6d  %6d\n', i, n_coupon );
      average = average + n_coupon;
    end

    average = average / n_trial;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Average wait was %f\n', average );

  end

  return
end
