require 'tk'

msg='hi'
root=TkRoot.new{title msg}
label_msg=TkLabel.new(root){
  text  msg
  pack :padx=>2,:pady=>2,:side=>'top'
  font "arial 20 bold"
}

Tk.mainloop