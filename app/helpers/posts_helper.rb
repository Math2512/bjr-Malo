module PostsHelper

    # @return [String]
    def view_more_button(pagy)
        return unless pagy.next

        button_to(pagy_url_for(pagy, pagy.next), class: "text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center") do
            concat "Afficher Plus"
            concat tag.svg(class: "rtl:rotate-180 w-3.5 h-3.5 ms-2", aria: { hidden: "true" }, xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 14 10") {
                concat tag.path(stroke: "currentColor", stroke_linecap: "round", stroke_linejoin: "round", stroke_width: "2", d: "M1 5h12m0 0L9 1m4 4L9 9")
            }
        end
    end
end
