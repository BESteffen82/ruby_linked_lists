require 'pry-byebug'

class Node
	attr_accessor :value, :next_node	

	def initialize(value=nil, next_node=nil)
		@value = value
		@next_node = next_node
	end	
end

class LinkedList
	attr_accessor :head, :tail

	def initialize
		@head = nil
		@tail = nil		
	end

	def start_list(value)
		node = Node.new(value)
		@head = node
		@tail = node
	end

	def append(value)
		node = Node.new(value)
		if @head.nil?
			@head = node			
		elsif @tail.nil?
			@head.next_node = node
			@tail = node
		else 
			@tail.next_node = node
			@tail = node 
		end				
	end

	def prepend(value)
		node = Node.new(value)
		previous_head = @head
		if @head.nil?
			@head = node
		elsif @tail.nil?
			@tail = previous_head
		else
			@head = node
			@head.next_node = previous_head
		end		
	end

	def size
		return 0 if @head.nil?
		node_count = 0
		current_node = @head
		until current_node == nil		
			current_node = current_node.next_node
			node_count += 1
		end
		node_count
	end
	
	def head		
		@head.value	
	end

	def tail
		@tail.value
	end

	def at(index)
		current_node = @head
		index = 
		index.times do
			current_node = current_node.next_node
		end		
		return current_node.value
	end

	def pop		
		current_node = @head
		until current_node.next_node.next_node == nil
			current_node = current_node.next_node
		end		
		last_node = current_node.next_node
		current_node.next_node = nil			
		last_node.value			
	end

	def contains?(value)
		current_node = @head
		includes_value = false
		until current_node.next_node == nil
			current_node = current_node.next_node
			if current_node.value == value
				includes_value = true
			end
		end
		return includes_value
	end

	def find(value)
		current_node = @head
		node_index = 0
		until current_node.next_node == nil
			current_node = current_node.next_node
			node_index += 1
			if value == current_node.value
			return node_index
			end
		end
	end

	def to_s
		current_node = @head		
		until current_node == nil			
			print "(#{current_node.value}) -> "
			current_node = current_node.next_node
		end
	end

	def insert_at(value, index)		
		current_node = @head
		node_index = 0		
		until current_node.next_node == nil
			current_node = current_node.next_node			
			if node_index == index - 2				
				inserted_node = Node.new(value)
				inserted_node.next_node = current_node.next_node
				current_node.next_node = inserted_node																
			end
			node_index += 1
		end
	end
end

#test procedures
linked_list = LinkedList.new
linked_list.prepend("Kona")
linked_list.append("Buster")
linked_list.append("Maggie")
linked_list.prepend("Bella")
linked_list.append("Bailey")
linked_list.prepend("Rosebud")
p linked_list.to_s
p linked_list.size
p linked_list.head
p linked_list.tail
p linked_list.at(3)
p linked_list.pop
p linked_list.to_s
p linked_list.size
p linked_list.contains?("Buster")
p linked_list.find("Bella")
linked_list.insert_at("Taffy", 2)
p linked_list.to_s
p linked_list.at(2)
p linked_list.size

