# README

rails generate scaffold Product description:text supplier:references asi_num:integer item_number:string page_num:integer
rails generate scaffold Customer name:string category:string
rails generate scaffold Supplier name:string product:references
rails generate scaffold User name:string email:string password_digest:string
