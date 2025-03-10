// import Foundation

/// A structure that contains the location and dimensions of a rectangle.
/// 
/// In the default Core Graphics coordinate space, the origin is located in the lower-left corner of the rectangle and the rectangle extends towards the upper-right corner. 
/// If the context has a flipped-coordinate space—often the case on iOS—the origin is in the upper-left corner and the rectangle extends towards the lower-right corner.
public struct CGRect: Equatable, Hashable, Sendable {

    // MARK: - Basic Geometric Properties

    /// A point that specifies the coordinates of the rectangle’s origin.
    public var origin: OpenCoreGraphics.CGPoint

    /// A size that specifies the height and width of the rectangle.
    public var size: OpenCoreGraphics.CGSize

    // MARK: - Special Values

    /// A rectangle that has infinite extent.
    public static let infinite: OpenCoreGraphics.CGRect = .init()

    /// The null rectangle, representing an invalid value.
    public static let null: OpenCoreGraphics.CGRect = .init()

    /// The rectangle whose origin and size are both zero.
    public static let zero: OpenCoreGraphics.CGRect = .init()

    // MARK: - Creating Rectangle Values

    /// Creates a rectangle with the specified origin and size.
    /// - Parameters:
    ///   - origin: A point that specifies the coordinates of the rectangle’s origin.
    ///   - size: A size that specifies the height and width of the rectangle.
    public init(origin: OpenCoreGraphics.CGPoint = .zero, size: OpenCoreGraphics.CGSize = .zero) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rectangle with coordinates and dimensions specified as floating-point values.
    /// - Parameters:
    ///   - x: The x-coordinate of the rectangle.
    ///   - y: The y-coordinate of the rectangle.
    ///   - width: A width value.
    ///   - height: A height value.
    public init(x: Float, y: Float, width: Float, height: Float) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
    }

    /// Creates a rectangle with coordinates and dimensions specified as integer values.
    /// - Parameters:
    ///   - x: The x-coordinate of the rectangle.
    ///   - y: The y-coordinate of the rectangle.
    ///   - width: A width value.
    ///   - height: A height value.
    public init(x: Int, y: Int, width: Int, height: Int) {
        self.origin = .init(x: x, y: y)
        self.size = .init(width: width, height: height)
    }

    // MARK: - Calculated Geometric Properties
    
    /// Returns the height of a rectangle.
    public var height: Float { size.height }

    /// Returns the width of a rectangle.
    public var width: Float { size.width }

    /// Returns the smallest value for the x-coordinate of the rectangle.
    public var minX: Float { origin.x }

    /// Returns the x- coordinate that establishes the center of a rectangle.
    public var midX: Float { (minX + maxX) / 2 }

    /// Returns the largest value of the x-coordinate for the rectangle.
    public var maxX: Float { origin.x + size.width }

    /// Returns the smallest value for the y-coordinate of the rectangle.
    public var minY: Float { origin.y }

    /// Returns the y-coordinate that establishes the center of the rectangle.
    public var midY: Float { (minY + maxY) / 2 }

    /// Returns the largest value for the y-coordinate of the rectangle.
    public var maxY: Float { origin.y + size.height }
}

extension CGRect : CustomStringConvertible {
    /// A textual representation of this instance.
    public var description: String {
        "CGRect(origin: \(origin), size: \(size))"
    }
}