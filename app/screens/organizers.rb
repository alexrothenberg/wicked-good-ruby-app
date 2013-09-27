module Screen
  class Organizers < PM::Screen
    def will_appear
      mm_drawerController.title = 'Organizers'
    end
  end
end