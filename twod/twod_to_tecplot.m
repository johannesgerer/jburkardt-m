function [] = twod_to_tecplot(x,e_conn,u,filename,title)
%------------------------------------------------------------------------------
%  twod_to_tecplot - function that accepts 2D finite element data and writes
%                    and input file to the graphics program Tecplot.
%
%  Usage:
%         [] = twod_to_tecplot(x,e_conn,u,filename,title)
%
%  Variables:     x
%                      spatial coordinates  (nodes x 2)
%                 e_conn
%                      element connectivity matrix  (3 nodes are used)
%                 u
%                      field variables
%                 filename
%                      name for the output tecplot file
%                 title
%                      title string required by tecplot
%------------------------------------------------------------------------------

[n_node,n_var] = size(u);
[n_elem,n_dof] = size(e_conn);

[fid] = fopen(filename,'w');

fprintf(fid,strcat(strcat('Title="',title),'"\n'));

temp_str = 'Variables="x","y"';
for i=1:n_var
  temp_str = strcat(strcat(temp_str,strcat(',"vec',strcat(num2str(i),'"'))));
end
temp_str = strcat(temp_str,'\n');
fprintf(fid,temp_str);

temp_str = 'Zone N = ';
temp_str = strcat( temp_str, num2str(n_node) );
temp_str = strcat( temp_str, ', E = ' );
temp_str = strcat( temp_str, num2str(n_elem) );
temp_str = strcat( temp_str, ', DATAPACKING = POINT, ZONETYPE = FETRIANGLE\n' );
fprintf(fid,temp_str);

print_str = ' %10.5g  %10.5g ';
for i=1:n_var
  print_str = strcat( print_str, ' %10.5g ' );
end
print_str = strcat( print_str, '\n' );

for i=1:n_node
  fprintf(fid,print_str,x(i,:),u(i,:));
end

print_str = ' %6d  %6d  %6d \n';
for i=1:n_elem
  fprintf(fid,print_str,e_conn(i,1:3));
end

fclose(fid);
% end function output_to_tecplot
