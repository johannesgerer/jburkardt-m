function [ mat ] = tsgReadMatrix( filename )
%
% [ mat ] = tsgReadMatrix( filename )
%
% reads a matrix from a file format
% 
% 3 4
% 1 2 3 4
% 5 6 7 8
% 9 10 11 12
%
% results in the matrix [ 1 2 3 4; 5 6 7 8; 9 10 11 12; ]
%

fid = fopen ( filename, 'rt' );

[ s ] = fscanf( fid, ' %d ', [1, 2 ] ); % load the number of points

Ni = s(1);
Nj = s(2);

if ( (Ni>0) && (Nj>0) )
    mat = zeros( Ni, Nj );
else
    mat = [];
end

for i = 1:Ni
    
    [ s ] = fscanf( fid, ' %f ', [1, Nj ] );
    
    mat(i,:) = s;
    
end;

fclose( fid );
