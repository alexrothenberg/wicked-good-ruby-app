module Screen
  class Sponsors < PM::Screen
    def will_appear
      mm_drawerController.title = 'Sponsors'
    end
  end
end
